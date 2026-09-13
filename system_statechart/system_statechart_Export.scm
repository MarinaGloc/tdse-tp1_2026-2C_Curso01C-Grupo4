{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
        "attrs": {
          "name": {
            "text": "system_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    // Eventos de entrada desde la capa Sensor\n    in event EV_SYS_CAR_ARRIVED\n    in event EV_SYS_CAM_VALIDATED\n    in event EV_SYS_BTN_DOWN\n    in event EV_SYS_CAR_PASSED\n\n    // Salidas / Comandos hacia la capa Actuator\n    out event ACT_CMD_CAM_CAPTURE\n    out event ACT_CMD_SERVER_LOG_PATENT\n    out event ACT_CMD_PRINT_START\n    out event ACT_CMD_BARRIER_OPEN_FAST\n    out event ACT_CMD_BARRIER_KEEP_OPEN\n    out event ACT_CMD_BARRIER_CLOSE_SLOW\n    out event ACT_CMD_BARRIER_LOWERED\n    out event ACT_CMD_RESET_ALL\n\n    // Temporizador principal de decremento cíclico (1ms)\n    var tick: integer = 0\n\n    // Constantes de tiempo (en ms / ticks)\n    const DEL_TIMEOUT_10s: integer = 10000\n    const DEL_TIMEOUT_15s: integer = 15000\n    const DEL_TIMEOUT_20s: integer = 20000\n    const DEL_PRINT_2s: integer = 2000\n    const DEL_BARRIER_3s: integer = 3000\n    const DEL_BARRIER_5s: integer = 5000\n"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": 410,
          "y": -219
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "0d188e63-7d28-42bb-b034-7eafff8f1867",
        "z": 97,
        "embeds": [
          "4ec93865-e3ee-4098-b7f2-fdbeec759342"
        ]
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 410,
          "y": -204
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "4ec93865-e3ee-4098-b7f2-fdbeec759342",
        "z": 98,
        "parent": "0d188e63-7d28-42bb-b034-7eafff8f1867"
      },
      {
        "position": {
          "x": -42,
          "y": -159
        },
        "size": {
          "width": 945,
          "height": 576
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "SYSTEM",
            "fontSize": 11
          }
        },
        "id": "079d3d4a-b714-4afb-b0dd-3d937195b784",
        "z": 100,
        "embeds": [
          "cfde5ca9-9fcf-4916-8eb4-da508923597a"
        ]
      },
      {
        "position": {
          "x": -39,
          "y": -114
        },
        "size": {
          "width": 939,
          "height": 528
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          }
        },
        "id": "cfde5ca9-9fcf-4916-8eb4-da508923597a",
        "z": 101,
        "embeds": [
          "c42bb0e8-56b7-46ab-baef-f3044b45bc47",
          "8702187f-3b3f-4215-ac79-3dcfd5434728",
          "5ff8a2ca-95f5-4965-a9da-d979346d7461",
          "1e2de1f9-085e-4ff8-861e-828eacbbd1ff",
          "7cfb3bea-1805-4b67-a32d-161674462280",
          "5ebcc0c7-4311-4083-a218-7d7f428c0194",
          "96cb174f-39ae-4b12-bbb6-7ef708038757",
          "436a35f9-0690-4a7c-a7d3-bb55468468fd",
          "c5f1d404-a7dd-4b6a-a5f3-57bc365aa9ca",
          "08080ac0-017d-4af1-b865-8c28b2addfe2",
          "4c2b6257-9fdb-476b-b854-0552e8833728",
          "8304fa13-896d-44d0-aac8-08dfc75ad153",
          "a512e9d8-e521-4c6e-ac1d-a03808a7769b",
          "f2d951af-a229-4eb5-b933-304f69c82f95",
          "6c0324dc-59fb-4311-bdbe-96509453e7a8",
          "b27079a9-19cc-413f-b836-10d11ebd3694",
          "2aa12e0d-f302-4c5b-bc96-c494503097c1",
          "18407ebc-fbc7-417e-8a19-eb486d406b03"
        ],
        "parent": "079d3d4a-b714-4afb-b0dd-3d937195b784"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "18407ebc-fbc7-417e-8a19-eb486d406b03"
        },
        "target": {
          "id": "8304fa13-896d-44d0-aac8-08dfc75ad153",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "36.667%",
              "dy": "73.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "always [tick == 0] / raise ACT_CMD_BARRIER_LOWERED"
              }
            },
            "position": {
              "distance": 0.8297103108834952,
              "offset": 140,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "c42bb0e8-56b7-46ab-baef-f3044b45bc47",
        "z": 102,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 3,
            "y": 316
          }
        ],
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "2aa12e0d-f302-4c5b-bc96-c494503097c1"
        },
        "target": {
          "id": "18407ebc-fbc7-417e-8a19-eb486d406b03",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "47.087%",
              "dy": "13.514%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_CAR_PASSED, always [tick == 0]"
              }
            },
            "position": {
              "offset": -104,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "8702187f-3b3f-4215-ac79-3dcfd5434728",
        "z": 103,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6c0324dc-59fb-4311-bdbe-96509453e7a8"
        },
        "target": {
          "id": "2aa12e0d-f302-4c5b-bc96-c494503097c1",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "96%",
              "dy": "53.012%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "always [tick == 0]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5ff8a2ca-95f5-4965-a9da-d979346d7461",
        "z": 104,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "b27079a9-19cc-413f-b836-10d11ebd3694"
        },
        "target": {
          "id": "6c0324dc-59fb-4311-bdbe-96509453e7a8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "97.396%",
              "dy": "48.101%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "always [tick == 0]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "1e2de1f9-085e-4ff8-861e-828eacbbd1ff",
        "z": 105,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f2d951af-a229-4eb5-b933-304f69c82f95"
        },
        "target": {
          "id": "8304fa13-896d-44d0-aac8-08dfc75ad153",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "70%",
              "dy": "26.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_CAR_PASSED, always [tick == 0]"
              }
            },
            "position": {
              "distance": 0.4937987160237788,
              "offset": 10.000000000000007,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "7cfb3bea-1805-4b67-a32d-161674462280",
        "z": 106,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 548,
            "y": -62
          }
        ],
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f2d951af-a229-4eb5-b933-304f69c82f95"
        },
        "target": {
          "id": "b27079a9-19cc-413f-b836-10d11ebd3694",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "46.948%",
              "dy": "20.833%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_BTN_DOWN"
              }
            },
            "position": {
              "distance": 0.47435897435897434,
              "offset": -44,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5ebcc0c7-4311-4083-a218-7d7f428c0194",
        "z": 107,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a512e9d8-e521-4c6e-ac1d-a03808a7769b"
        },
        "target": {
          "id": "f2d951af-a229-4eb5-b933-304f69c82f95",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "5%",
              "dy": "53.125%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_CAM_VALIDATED"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "96cb174f-39ae-4b12-bbb6-7ef708038757",
        "z": 108,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "8304fa13-896d-44d0-aac8-08dfc75ad153"
        },
        "target": {
          "id": "a512e9d8-e521-4c6e-ac1d-a03808a7769b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "10%",
              "dy": "46.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_CAR_ARRIVED"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "436a35f9-0690-4a7c-a7d3-bb55468468fd",
        "z": 109,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a512e9d8-e521-4c6e-ac1d-a03808a7769b"
        },
        "target": {
          "id": "8304fa13-896d-44d0-aac8-08dfc75ad153",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "86.667%",
              "dy": "76.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_CAR_PASSED, always [tick == 0]"
              }
            },
            "position": {
              "distance": 0.5112994350282486,
              "offset": -14,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "c5f1d404-a7dd-4b6a-a5f3-57bc365aa9ca",
        "z": 110,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4c2b6257-9fdb-476b-b854-0552e8833728"
        },
        "target": {
          "id": "8304fa13-896d-44d0-aac8-08dfc75ad153"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "router": {
          "name": "orthogonal"
        },
        "id": "08080ac0-017d-4af1-b865-8c28b2addfe2",
        "z": 111,
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "position": {
          "x": 3.5,
          "y": -94
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "4c2b6257-9fdb-476b-b854-0552e8833728",
        "z": 112,
        "embeds": [
          "8212172c-cc00-451a-9e01-a35bcc1e601c"
        ],
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 3.5,
          "y": -79
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "8212172c-cc00-451a-9e01-a35bcc1e601c",
        "z": 113,
        "parent": "4c2b6257-9fdb-476b-b854-0552e8833728"
      },
      {
        "position": {
          "x": -19,
          "y": -24
        },
        "size": {
          "height": 60,
          "width": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_IDLE",
            "fontSize": 11
          }
        },
        "id": "8304fa13-896d-44d0-aac8-08dfc75ad153",
        "z": 114,
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "position": {
          "x": 345,
          "y": -33
        },
        "size": {
          "height": 84,
          "width": 162
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_WAIT_CAM_PANEL",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / raise ACT_CMD_CAM_CAPTURE; tick = DEL_TIMEOUT_10s\r\nalways [tick > 0] / tick--"
          }
        },
        "id": "a512e9d8-e521-4c6e-ac1d-a03808a7769b",
        "z": 115,
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "position": {
          "x": 680,
          "y": -34
        },
        "size": {
          "width": 181,
          "height": 89
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_WAIT_BTN_PRESS",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / raise ACT_CMD_SERVER_LOG_PATENT; tick = DEL_TIMEOUT_15s\r\nalways [tick > 0] / tick--"
          }
        },
        "id": "f2d951af-a229-4eb5-b933-304f69c82f95",
        "z": 116,
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "position": {
          "x": 338,
          "y": 133
        },
        "size": {
          "width": 192,
          "height": 79
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_OPENING_BARRIER",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / raise ACT_CMD_BARRIER_OPEN_FAST; tick = DEL_BARRIER_3s\r\nalways [tick > 0] / tick--"
          }
        },
        "id": "6c0324dc-59fb-4311-bdbe-96509453e7a8",
        "z": 117,
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "position": {
          "x": 670,
          "y": 133
        },
        "size": {
          "width": 213,
          "height": 72
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_PRINT_TICKET",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / raise ACT_CMD_PRINT_START; tick = DEL_PRINT_2s\r\nalways [tick > 0] / tick--"
          }
        },
        "id": "b27079a9-19cc-413f-b836-10d11ebd3694",
        "z": 118,
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "position": {
          "x": 40,
          "y": 121
        },
        "size": {
          "width": 175,
          "height": 83
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_WAIT_CAR_PASS",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / raise ACT_CMD_BARRIER_KEEP_OPEN; tick = DEL_TIMEOUT_20s\r\nalways [tick > 0] / tick--"
          }
        },
        "id": "2aa12e0d-f302-4c5b-bc96-c494503097c1",
        "z": 119,
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "position": {
          "x": 24,
          "y": 276
        },
        "size": {
          "width": 205,
          "height": 81
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_CLOSING_BARRIER",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / raise ACT_CMD_BARRIER_CLOSE_SLOW; tick = DEL_BARRIER_5s\r\nalways [tick > 0] / tick--"
          }
        },
        "id": "18407ebc-fbc7-417e-8a19-eb486d406b03",
        "z": 120,
        "parent": "cfde5ca9-9fcf-4916-8eb4-da508923597a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0d188e63-7d28-42bb-b034-7eafff8f1867"
        },
        "target": {
          "id": "079d3d4a-b714-4afb-b0dd-3d937195b784",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "48.677%",
              "dy": "2.331%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "eea551f3-75e3-409e-9a03-d915891b3936",
        "z": 121,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "MyFirstStatechart",
          "statemachinePrefix": "myFirstStatechart",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}