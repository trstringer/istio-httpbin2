HTTPBIN2_CHART=httpbin2-resiliency
CHART_REPO=oci://ghcr.io/trstringer/charts
ISTIO_HTTPBIN2_CHART=istio-httpbin2

.PHONY: charts-clean
charts-clean:
	find . -name "*.tgz" -delete

.PHONY: chart-httpbin2-build
chart-httpbin2-build: charts-clean
	helm package ./charts/$(HTTPBIN2_CHART)

.PHONY: chart-httpbin2-push
chart-httpbin2-push: chart-httpbin2-build
	helm push $(shell find . -name "httpbin2-resiliency-*.tgz") $(CHART_REPO)

.PHONY: chart-istio-httpbin2-build
chart-istio-httpbin2-build: charts-clean
	helm package ./charts/$(ISTIO_HTTPBIN2_CHART)

.PHONY: chart-istio-httpbin2-push
chart-istio-httpbin2-push: chart-istio-httpbin2-build
	helm push $(shell find . -name "istio-httpbin2-*.tgz") $(CHART_REPO)
