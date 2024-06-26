package com.example;

import org.apache.flink.api.common.functions.MapFunction;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.connectors.pulsar.FlinkPulsarSource;
import org.apache.flink.streaming.util.serialization.SimpleStringSchema;

public class PulsarFlinkIntegration {
    public static void main(String[] args) throws Exception {
        StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        FlinkPulsarSource<String> pulsarSource = new FlinkPulsarSource<>(
            "pulsar://localhost:6650",
            "persistent://public/default/my-topic",
            new SimpleStringSchema()
        );

        DataStream<String> stream = env.addSource(pulsarSource);

        stream.map(new MapFunction<String, String>() {
            @Override
            public String map(String value) throws Exception {
                return "Processed: " + value;
            }
        }).print();

        env.execute("Pulsar Flink Integration");
    }
}
