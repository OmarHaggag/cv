# Omar Haggag's CV and Cover Letters

This repository contains the LaTeX source code for Omar Haggag's curriculum vitae (CV) and tailored cover letters for different professional fields.
## Contents

### Root Directory
- `OmarHaggagCV.tex`: The main LaTeX file containing the CV content with recent updates including LLM deployment and RAG development
- `Makefile`: Build system for compiling all documents to `~/personal/cv/root-CV/`
- `README.md`: This file, providing information about the repository

### Cover Letter Directories
Each directory contains two cover letters tailored for specific fields:
- `cover_letter_contract.tex`: For part-time contract positions
- `cover_letter_permit.tex`: For part-time work permit positions

#### Available Directories:
- `cad/`: CAD/EDA Engineering positions
- `ai/`: AI/ML and LLM engineering positions
- `power_electronics/`: Power electronics hardware positions

## Recent CV Updates

### New Additions:
1. **LLM Server Infrastructure**: Added experience deploying local LLMs (Ollama, Qwen7b, Llama3) serving 200+ users
2. **RAG Development**: Added experience with LangChain, LangGraph, and ChromaDB for knowledge base integration
3. **Python AI/RAG Skills**: New skills section listing:
   - LangChain, LangGraph, LangSmith
   - ChromaDB, FAISS
   - OpenAI API, Ollama Python SDK
   - HuggingFace Transformers
## Building

### Prerequisites
- pdflatex (TeX Live or MiKTeX)
- modernCV package

### Compilation

Using the Makefile (recommended):
