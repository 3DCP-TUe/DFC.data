# Setupinfo structure

## Categorization

The components are categorized as follows: 

```
class: conduit
class: material delivery systems
    main object: material delivery plc
    subclass: dosing systems
    subclass: inserts
    subclass: mixer pumps
    subclass: pumps
    subclass: silos/storage
class: motion systems
class: printheads
    main object: printhead plc
    subclass: inserts
    subclass: nozzles
    subclass: static
    subclass: dynamic
class: sensors
```

Inserts are components that are placed inside other components. Examples include feeding screws used in dosing systems and mixing blades.

## Component structure

```
+-- component
|   +-- name
|   |   +-- docs
|   |   |   +-- doc.pdf
|   |   |   +-- ...
|   |   +-- metadata.yml
|   |   +-- name.stl
|   |   +-- name.jpg
|   |   +-- ...
```

## Coding system

```
mc25f   Mortar coupling, 25 mm, female          (options: 25, 35, 50, female, male)
mc35m   Mortar coupling, 35 mm, male            (options: 25, 35, 50, female, male)
fl40    Flange DN40                             (options: 5, 10, 15, 20, 25, 32, 40, etc.)
tc93    Tri-clamp flange diameter 93 mm         (options: 25, 51, 64, 78, 91, 119, etc.)
pi6     Push-in fitting 6 mm outer diameter     (options: 4, 6, 8, 10, 12, etc.)
so42    Slip-on 42 mm outer diameter
geka    GEKA coupling
pfd     Pressure flange for D-pump              (options: A, B, C, D, R, T, L-pump)
sfr     Suction flange for R-pump               (options: A, B, C, D, R, T, L-pump)
```

Logic used for a component: `COUPLING_IN-COUPLING_OUT-DIAMETER-OPTIONAL_DIAMETER_2-CUSTOM_PROPERTY-ID_NUMBER`

Examples are:

```
hose mc35f-mc35m-d35-l5000-1
reducer tc93-tc64-d73-d50-1
elbow mc35f-mc35m-d35-a90-1
adapter fl40-mc35m-d35-1
coriolis sensor fl40-fl40-d35-1
pressure sensor mc35f-mc35m-d35-25bar-1
pressure sensor mc35f-mc35m-d35-25bar-2
pressure sensor mc35f-mc35m-d35-10bar-1
```
