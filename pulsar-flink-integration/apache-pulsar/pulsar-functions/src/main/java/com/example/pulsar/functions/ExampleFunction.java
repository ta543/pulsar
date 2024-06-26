package com.example.pulsar.functions;

import org.apache.pulsar.functions.api.Context;
import org.apache.pulsar.functions.api.Function;

public class ExampleFunction implements Function<String, String> {
    @Override
    public String process(String input, Context context) {
        // Example function logic
        return "Processed: " + input;
    }
}
