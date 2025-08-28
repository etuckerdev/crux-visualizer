#!/usr/bin/env python3
"""Simple OBJ viewer using trimesh (and pyglet backend).

Usage:
  python tools/view_obj.py path/to/model.obj

If dependencies are missing, the script will print a one-line pip install command.
"""
import sys
import os

DEFAULT = os.path.join(os.path.dirname(__file__), '..', 'simple_visualizer_output.obj')

def main():
    path = sys.argv[1] if len(sys.argv) > 1 else DEFAULT
    path = os.path.abspath(path)
    if not os.path.exists(path):
        print(f"Error: file not found: {path}")
        return 2
    try:
        import trimesh
    except Exception as e:
        print("Missing Python dependency: trimesh")
        print("Install with: pip install trimesh pyglet")
        return 3

    try:
        mesh = trimesh.load(path)
    except Exception as e:
        print(f"Failed to load mesh: {e}")
        return 4

    # Print quick info
    # Determine vertex and face count based on mesh type
    vcount = 0
    fcount = 0
    import trimesh
    if isinstance(mesh, trimesh.Scene):
        # mesh is a Scene
        for geom in mesh.geometry.values():
            if hasattr(geom, 'vertices') and hasattr(geom, 'faces'):
                vcount += len(geom.vertices)
                fcount += len(geom.faces)
    elif isinstance(mesh, trimesh.Trimesh):
        # mesh is a Trimesh
        vcount = len(mesh.vertices)
        fcount = len(mesh.faces)
    else:
        vcount = None
        fcount = None

    print(f"Loaded: {os.path.basename(path)} — vertices={vcount}, faces={fcount}")

    # Show the mesh. trimesh tries to pick a viewer (pyglet, pyglet+egl, or external).
    try:
        mesh.show()
    except Exception as e:
        print(f"mesh.show() failed: {e}")
        print("If you don't have an available GL backend, consider running on a machine with a display or use headless tools to export an image.")
        return 5

    return 0

if __name__ == '__main__':
    sys.exit(main())
