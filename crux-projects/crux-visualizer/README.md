Crux Visualizer

This crate implements a WGPU-based 3D visualizer for the Crux Manifold Engine.

Features implemented in this scaffold:
- Parametric manifold mesh generators (torus, sphere, Möbius, hyperboloid, Klein projection)
- WGPU renderer skeleton with instanced node rendering
- CruxVisualizer integration point with async update channel
- Plugin trait for custom visualizations
- Example application in `examples/simple_visualizer.rs`
- Unit tests for mathematical functions

How to build

This project requires a working Rust toolchain and system support for WGPU (Vulkan/Metal/DirectX/OpenGL). To build:

```bash
cd /path/to/crux-visualizer
cargo build --features render
```

To run the example (requires GPU and windowing):

```bash
cargo run --example simple_visualizer --features render
```

Notes

This is a scaffold focused on correctness of manifold generators and a performant rendering approach (instancing, spatial indexing). Further work: full shader effects, geodesic edge routing, WebSocket live updates, headless rendering pipeline, and more advanced UI.
