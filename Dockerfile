FROM cgr.dev/chainguard/python@sha256:c23539f80289046e2fa734d3f3fc418833fc22d064a50cc43fa9a6edc28c1615 AS builder

WORKDIR /build

COPY requirements.txt ./
RUN pip install --no-cache-dir --target=/build/dependencies -r requirements.txt

FROM cgr.dev/chainguard/python@sha256:1f37785e5cdb70151f36aaa15e1e3cef4571424dbefbf4b0d8a9222535cb13ff

WORKDIR /app

ENV PORT=8080

COPY --from=builder /build/dependencies /app/dependencies
ENV PYTHONPATH=/app/dependencies

COPY . .

EXPOSE 8080

CMD ["-m", "gunicorn", "helloworld:app"]
