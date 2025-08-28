use criterion::{criterion_group, criterion_main, Criterion};
use crux_visualizer::manifolds;

fn bench_torus(c: &mut Criterion) {
    c.bench_function("gen_torus_128x64", |b| b.iter(|| manifolds::gen_torus(3.0, 1.0, 128, 64).unwrap()));
}

criterion_group!(benches, bench_torus);
criterion_main!(benches);
