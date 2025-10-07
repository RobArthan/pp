# ProofPower Copilot Instructions

## Project Overview
ProofPower is a suite of tools for specification and proof in Higher-Order Logic (HOL) and Z notation. The system supports formal specification and theorem proving with multiple ML compilers (Poly/ML, SML/NJ, MLton).

## Architecture & Components

### Core Package Dependencies (build in order)
1. **pptex** - LaTeX/TeX processing foundation (no dependencies)
2. **dev** - Development tools and utilities (depends on pptex)
3. **xpp** - X11-based ProofPower editor (depends on pptex)
4. **hol** - Higher-Order Logic theorem prover (depends on dev)
5. **zed** - Z specification language support (depends on hol)  
6. **daz** - Compliance tool for Ada/SPARK (depends on zed)
7. **foundry** - Font resources for mathematical symbols

### Key File Types
- **`.pp` files**: ProofPower literate documents (mix LaTeX, SML, and formal specs)
- **`.mkf` files**: Package-specific makefiles following consistent pattern
- **`.sml` files**: Standard ML source code
- **`.ldd` files**: Build completion markers (package.ldd = package built)

## Development Workflow

### Environment Setup
Always source the environment first:
```bash
. dev_env  # Sets up PPCOMPILER, PPTARGETDIR, PATH, etc.
```

### Building Packages
Each package uses pattern: `make -f <package>.mkf <target>`
(in the package directory)
In the src directory there is a top-level Makefile to build all packages.

**Common targets:**
- `inst` - Build and install (full build with docs)
- `bininst` - Binary install only (faster, no doc regeneration)
- `test` - Run test suite
- `clean` - Clean build artifacts

**Package build sequence:**
```bash
for p in pptex xpp dev hol zed daz; do
    cd src/$p && make -f $p.mkf inst
done
```
or use the src/Makefile:
```bash
cd src
make all
```

**Individual package development:**
```bash
cd src/hol
make -f hol.mkf clean
make -f hol.mkf bininst  # Faster for development iterations
make -f hol.mkf test     # Run tests
```

### Key Environment Variables
- `PPCOMPILER`: POLYML, SMLNJ, or MLTON
- `PPTARGETDIR`: Installation target (defaults to `../../bld`)
- `PPVER`: Version string
- `PPENVSCRIPT`: Environment script path (defaults to `../dev_env`)

## File Patterns & Conventions

### Documentation Structure
ProofPower uses literate programming - `.pp` files contain:
- `=TEX` sections: LaTeX documentation
- `=SML` sections: Standard ML code
- `=IGN` sections: Comments/ignored content

### Build System Patterns
- Each package has `<name>.mkf` makefile in its directory
- Top-level `src/Makefile` orchestrates multi-package builds
- `.ldd` files track build completion status
- Environment sourcing pattern: `. $(ENVSCRIPT)` in makefiles

### Testing Conventions
- Test files often named `mdt*.pp` (module test documents)
- Test execution via package-specific `test` targets
- Test reports generated in package directories

## Common Operations

### Adding New Features
1. Work in appropriate `src/<package>/` directory
2. Follow `.pp` literate programming format for new files
3. Update package `.mkf` file if adding new modules
4. Use `bininst` target for faster development cycles
5. Run `test` target to verify changes

### Release Process
Use `tools/make_rel` script:
```bash
cd tools
./make_rel -v 1.1w53  # Creates release in ../rel/
```

### Cross-Package Changes
Respect dependency order when making changes across packages. Changes in lower-level packages (dev, hol) may require rebuilding dependent packages (zed, daz).

## Integration Points
- X11 integration via `xpp` package for graphical interface
- LaTeX integration via `pptex` for document processing
- Multiple ML compiler support requires compiler-specific build logic
- Font system integration via `foundry` package for mathematical symbols

## Change History

After changing a document which includes a change(s) history, add an entry describing the changes.
Use the same format as the existing entries.