#!/bin/bash

set -e
errors=0

# Run unit tests
python ampliseq_normalise/ampliseq_normalise_test.py || {
    echo "'python python/ampliseq_normalise/ampliseq_normalise_test.py' failed"
    let errors+=1
}

# Check program style
pylint -E ampliseq_normalise/*.py || {
    echo 'pylint -E ampliseq_normalise/*.py failed'
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Python specific tests"
