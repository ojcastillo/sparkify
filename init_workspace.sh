if ! conda env list | grep -q 'sparkify'; then
    echo "Didn't find a 'sparkify' conda env. Setting one for you."
    conda create -n sparkify python=3.7 pip
fi

echo "Activating sparkify env"
conda activate sparkify

echo "Installing dependencies into sparkify env"
pip install -r requirements.txt
