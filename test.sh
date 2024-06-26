#!/bin/bash

# Root directory of the project
PROJECT_DIR="pulsar-flink-integration"

# Create grafana/provisioning directory and subdirectories
mkdir -p $PROJECT_DIR/grafana/provisioning/datasources
mkdir -p $PROJECT_DIR/grafana/provisioning/dashboards
mkdir -p $PROJECT_DIR/grafana/provisioning/notifiers

# Create datasource.yaml
cat <<EOL > $PROJECT_DIR/grafana/provisioning/datasources/datasource.yaml
apiVersion: 1

datasources:
  - name: Prometheus
    type: prometheus
    access: proxy
    url: http://localhost:9090
    isDefault: true
    editable: true
EOL

# Create dashboards.yaml
cat <<EOL > $PROJECT_DIR/grafana/provisioning/dashboards/dashboards.yaml
apiVersion: 1

providers:
  - name: 'default'
    orgId: 1
    folder: ''
    type: file
    disableDeletion: false
    updateIntervalSeconds: 10
    options:
      path: /var/lib/grafana/dashboards
EOL

# Create notifiers.yaml
cat <<EOL > $PROJECT_DIR/grafana/provisioning/notifiers/notifiers.yaml
notifiers:
  - name: email
    type: email
    uid: email-notifier
    isDefault: true
    sendReminder: false
    disableResolveMessage: false
    frequency: 15m
    settings:
      addresses: user@example.com
EOL

echo "Grafana provisioning configuration files created successfully."
