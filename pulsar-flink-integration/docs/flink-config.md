# Apache Flink Configuration

## Standalone Mode

To start Apache Flink in standalone mode, run the following command:

```bash
./bin/start-cluster.sh
```

## Submitting Jobs

To submit a Flink job, use the following command:

```bash
./bin/flink run -c com.example.PulsarFlinkIntegration /path/to/your/flink-job.jar
```
