HTTPBIN2_CHART=httpbin2-resiliency
HTTPBIN2_CHART_REPO=oci://ghcr.io/trstringer/charts

.PHONY: charts-clean
charts-clean:
	find . -name "*.tgz" -delete

.PHONY: chart-httpbin2-build
chart-httpbin2-build: charts-clean
	helm package ./charts/$(HTTPBIN2_CHART)

.PHONY: chart-httpbin2-push
chart-httpbin2-push: chart-httpbin2-build
	helm push $(shell find . -name "httpbin2-resiliency-*.tgz") $(HTTPBIN2_CHART_REPO)
