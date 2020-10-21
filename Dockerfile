FROM python:3.6-slim

LABEL repository="https://github.com/aiaibot/publish-unit-test-result"
LABEL homepage="https://github.com/aiaibot/publish-unit-test-result"
LABEL maintainer="aiaibot"

LABEL com.github.actions.name="Publish Unit Test Results"
LABEL com.github.actions.description="A GitHub Action to publish unit test results."
LABEL com.github.actions.icon="check-circle"
LABEL com.github.actions.color="green"

COPY requirements.txt /action/
RUN pip install --upgrade --force --no-cache-dir pip && pip install --upgrade --force --no-cache-dir -r /action/requirements.txt

COPY githubext /action/githubext
COPY publish_unit_test_results.py /action/

ENTRYPOINT ["python", "/action/publish_unit_test_results.py"]
