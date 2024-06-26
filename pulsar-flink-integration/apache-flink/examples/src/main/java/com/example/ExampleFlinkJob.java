package com.example;

import org.apache.flink.api.java.ExecutionEnvironment;
import org.apache.flink.api.java.DataSet;
import org.apache.flink.api.java.tuple.Tuple2;
import org.apache.flink.api.common.functions.FlatMapFunction;
import org.apache.flink.util.Collector;

public class ExampleFlinkJob {
    public static void main(String[] args) throws Exception {
        // Set up the execution environment
        final ExecutionEnvironment env = ExecutionEnvironment.getExecutionEnvironment();

        // Read input text file
        DataSet<String> text = env.readTextFile("examples/input.txt");

        // Split up the lines into words and count them
        DataSet<Tuple2<String, Integer>> counts = text
            .flatMap(new LineSplitter())
            .groupBy(0)
            .sum(1);

        // Write the result to an output text file
        counts.writeAsCsv("examples/output.csv", "\n", " ");

        // Execute the program
        env.execute("Flink Batch Java API Skeleton");
    }

    // User-defined function to split lines into words
    public static final class LineSplitter implements FlatMapFunction<String, Tuple2<String, Integer>> {
        @Override
        public void flatMap(String value, Collector<Tuple2<String, Integer>> out) {
            // Normalize and split the line into words
            String[] words = value.toLowerCase().split("\W+");

            // Emit the words
            for (String word : words) {
                if (word.length() > 0) {
                    out.collect(new Tuple2<>(word, 1));
                }
            }
        }
    }
}
