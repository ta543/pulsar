package com.example.flink;

import org.apache.flink.api.java.tuple.Tuple2;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.test.util.AbstractTestBase;
import org.apache.flink.test.util.TestBaseUtils;
import org.junit.Test;

import java.util.List;

public class ExampleFlinkJobTest extends AbstractTestBase {

    @Test
    public void testExampleFlinkJob() throws Exception {
        // Set up the execution environment
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // Create a DataStream with test data
        DataStream<String> text = env.fromElements(
                "Apache Flink is a framework",
                "and distributed processing engine",
                "for stateful computations",
                "over unbounded and bounded data streams."
        );

        // Process the data
        DataStream<Tuple2<String, Integer>> wordCounts = text
            .flatMap(new ExampleFlinkJob.Tokenizer())
            .keyBy(value -> value.f0)
            .sum(1);

        // Collect the results
        List<Tuple2<String, Integer>> results = TestBaseUtils.collectStream(wordCounts);

        // Expected results
        List<Tuple2<String, Integer>> expectedResults = List.of(
            Tuple2.of("apache", 1),
            Tuple2.of("flink", 1),
            Tuple2.of("is", 1),
            Tuple2.of("a", 1),
            Tuple2.of("framework", 1),
            Tuple2.of("and", 1),
            Tuple2.of("distributed", 1),
            Tuple2.of("processing", 1),
            Tuple2.of("engine", 1),
            Tuple2.of("for", 1),
            Tuple2.of("stateful", 1),
            Tuple2.of("computations", 1),
            Tuple2.of("over", 1),
            Tuple2.of("unbounded", 1),
            Tuple2.of("and", 1),
            Tuple2.of("bounded", 1),
            Tuple2.of("data", 1),
            Tuple2.of("streams", 1)
        );

        // Verify the results
        TestBaseUtils.compareResultsAsTuples(expectedResults, results);
    }
}
