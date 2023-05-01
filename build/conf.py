# Configuration file for Sphinx documentation builder.

# -- Project information -----------------------------------------------------

project = 'Mon Projet'
author = 'Mon Auteur'
version = '1.0'
release = '1.0'

# -- General configuration ---------------------------------------------------

extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.napoleon',
]

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']
html_theme = 'sphinx_rtd_theme'

# -- Options for HTML output -------------------------------------------------

html_static_path = ['_static']
