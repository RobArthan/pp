=IGN
********************************************************************************
sholisvcs.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
%\documentstyle[twoside, 10pt, madams44, hol1]{article}
%\documentstyle[twoside, 10pt, TQa4, hol1]{article}
\documentclass[a4paper, 10pt]{article}
\usepackage{A4}
\usepackage{ProofPower}
%\latextwohack

\setlength{\parindent}{0mm}
\setlength{\parskip}{3mm}
\raggedbottom

%\docno{}
%\class{}



\title{Z document for compliance Argument for SHOLIS Alarm Package Body}

\author{}

\date{\today}

\begin{document}

\maketitle


%\startmain

\ftlinepenalty=9999

\section{Basic Types}

=SML
open_theory "cn";

new_theory "BASICTYPESspec";
=TEX

ⓈZ
│ BASICTYPESoBRIDGEDISPLAY ≜ 0
■

ⓈZ
│ BASICTYPESoDISPLAYPOSITION ≜
│ BASICTYPESoBRIDGEDISPLAY .. BASICTYPESoBRIDGEDISPLAY
■

ⓈZ
│ BASICTYPESoDISPLAYPOSITIONvFIRST ≜ BASICTYPESoBRIDGEDISPLAY
■

ⓈZ
│ BASICTYPESoDISPLAYPOSITIONvLAST ≜ BASICTYPESoBRIDGEDISPLAY
■

ⓈZ
│ BASICTYPESoDISPLAYPOSITIONvSUCC ≜
│ (BASICTYPESoDISPLAYPOSITION \ {BASICTYPESoDISPLAYPOSITIONvLAST}) ◁ succ
■

ⓈZ
│ BASICTYPESoDISPLAYPOSITIONvPRED ≜ BASICTYPESoDISPLAYPOSITIONvSUCC ↗~↕
■

ⓈZ
│ BASICTYPESoDISPLAYPOSITIONvPOS ≜ id BASICTYPESoDISPLAYPOSITION
■

ⓈZ
│ BASICTYPESoDISPLAYPOSITIONvVAL ≜ BASICTYPESoDISPLAYPOSITIONvPOS ↗~↕
■

ⓈZ
│ BASICTYPESoANGLE ≜ ~ 1800 .. 1799
■

ⓈZ
│ BASICTYPESoANGLEvFIRST ≜ ~ 1800
■

ⓈZ
│ BASICTYPESoANGLEvLAST ≜ 1799
■

ⓈZ
│ BASICTYPESoDISPLAYANGLE ≜ ~ 180 .. 179
■

ⓈZ
│ BASICTYPESoDISPLAYANGLEvFIRST ≜ ~ 180
■

ⓈZ
│ BASICTYPESoDISPLAYANGLEvLAST ≜ 179
■

ⓈZ
│ BASICTYPESoSPEED ≜ 0 .. 55
■

ⓈZ
│ BASICTYPESoSPEEDvFIRST ≜ 0
■

ⓈZ
│ BASICTYPESoSPEEDvLAST ≜ 55
■

ⓈZ
│ BASICTYPESoWINDVECTOR ≜
│ [WINDSPEED : BASICTYPESoSPEED; WINDDIRECTION : BASICTYPESoANGLE]
■

ⓈZ
│ BASICTYPESoDISPLAYVECTOR ≜
│ [SIZE : BASICTYPESoSPEED; DIRECTION : BASICTYPESoDISPLAYANGLE]
■

ⓈZ
│ BASICTYPESoNOERROR ≜ 0
■

ⓈZ
│ BASICTYPESoMAXERROR ≜ 1
■

ⓈZ
│ BASICTYPESoERROR ≜ BASICTYPESoNOERROR .. BASICTYPESoMAXERROR
■

ⓈZ
│ BASICTYPESoERRORvFIRST ≜ BASICTYPESoNOERROR
■

ⓈZ
│ BASICTYPESoERRORvLAST ≜ BASICTYPESoMAXERROR
■

ⓈZ
│ BASICTYPESoERRORvSUCC ≜
│ (BASICTYPESoERROR \ {BASICTYPESoERRORvLAST}) ◁ succ
■

ⓈZ
│ BASICTYPESoERRORvPRED ≜ BASICTYPESoERRORvSUCC ↗~↕
■

ⓈZ
│ BASICTYPESoERRORvPOS ≜ id BASICTYPESoERROR
■

ⓈZ
│ BASICTYPESoERRORvVAL ≜ BASICTYPESoERRORvPOS ↗~↕
■

ⓈZ
│ BASICTYPESoTIME ≜ 0 .. 2 ** 31 - 1
■

ⓈZ
│ BASICTYPESoTIMEvFIRST ≜ 0
■

ⓈZ
│ BASICTYPESoTIMEvLAST ≜ 2 ** 31 - 1
■

ⓈZ
│ BASICTYPESoTICKSPERSEC ≜ 614628
■

ⓈZ
│ BASICTYPESoNOSELECTIONINPROGRESS ≜ 0
■

ⓈZ
│ BASICTYPESoSELECTIONINPROGRESS ≜ 1
■

ⓈZ
│ BASICTYPESoSELECTIONSTATUS ≜
│ BASICTYPESoNOSELECTIONINPROGRESS .. BASICTYPESoSELECTIONINPROGRESS
■

ⓈZ
│ BASICTYPESoSELECTIONSTATUSvFIRST ≜ BASICTYPESoNOSELECTIONINPROGRESS
■

ⓈZ
│ BASICTYPESoSELECTIONSTATUSvLAST ≜ BASICTYPESoSELECTIONINPROGRESS
■

ⓈZ
│ BASICTYPESoSELECTIONSTATUSvSUCC ≜
│ (BASICTYPESoSELECTIONSTATUS \ {BASICTYPESoSELECTIONSTATUSvLAST}) ◁ succ
■

ⓈZ
│ BASICTYPESoSELECTIONSTATUSvPRED ≜ BASICTYPESoSELECTIONSTATUSvSUCC ↗~↕
■

ⓈZ
│ BASICTYPESoSELECTIONSTATUSvPOS ≜ id BASICTYPESoSELECTIONSTATUS
■

ⓈZ
│ BASICTYPESoSELECTIONSTATUSvVAL ≜ BASICTYPESoSELECTIONSTATUSvPOS ↗~↕
■

ⓈZ
│ BASICTYPESoNONE ≜ 0
■

ⓈZ
│ BASICTYPESoINITIAL ≜ 1
■

ⓈZ
│ BASICTYPESoSHOL ≜ 2
■

ⓈZ
│ BASICTYPESoSHOLSELECTION ≜ 3
■

ⓈZ
│ BASICTYPESoHISTORY ≜ 4
■

ⓈZ
│ BASICTYPESoCONEOFCOURSES ≜ 5
■

ⓈZ
│ BASICTYPESoPOLARGRAPH ≜ 6
■

ⓈZ
│ BASICTYPESoCONETEMPLATE ≜ 7
■

ⓈZ
│ BASICTYPESoINITIALSELECTION ≜ 8
■

ⓈZ
│ BASICTYPESoDISPLAYPAGE ≜ BASICTYPESoNONE .. BASICTYPESoINITIALSELECTION
■

ⓈZ
│ BASICTYPESoDISPLAYPAGEvFIRST ≜ BASICTYPESoNONE
■

ⓈZ
│ BASICTYPESoDISPLAYPAGEvLAST ≜ BASICTYPESoINITIALSELECTION
■

ⓈZ
│ BASICTYPESoDISPLAYPAGEvSUCC ≜
│ (BASICTYPESoDISPLAYPAGE \ {BASICTYPESoDISPLAYPAGEvLAST}) ◁ succ
■

ⓈZ
│ BASICTYPESoDISPLAYPAGEvPRED ≜ BASICTYPESoDISPLAYPAGEvSUCC ↗~↕
■

ⓈZ
│ BASICTYPESoDISPLAYPAGEvPOS ≜ id BASICTYPESoDISPLAYPAGE
■

ⓈZ
│ BASICTYPESoDISPLAYPAGEvVAL ≜ BASICTYPESoDISPLAYPAGEvPOS ↗~↕
■

ⓈZ
│ BASICTYPESoANGLECIRCLE ≜ 3600
■

ⓈZ
│ BASICTYPESoDISPLAYANGLECIRLCE ≜ 360
■

ⓈZ
│ BASICTYPESoAVAILABLEBUTTONSINDEX ≜ 1 .. 8
■

ⓈZ
│ BASICTYPESoAVAILABLEBUTTONSINDEXvFIRST ≜ 1
■

ⓈZ
│ BASICTYPESoAVAILABLEBUTTONSINDEXvLAST ≜ 8
■

ⓈZ
│ BASICTYPESoAVAILABLEBUTTONSINDEXvSUCC ≜ INTEGERvSUCC
■

ⓈZ
│ BASICTYPESoAVAILABLEBUTTONSINDEXvPRED ≜ INTEGERvPRED
■

ⓈZ
│ BASICTYPESoAVAILABLEBUTTONSINDEXvPOS ≜ INTEGERvPOS
■

ⓈZ
│ BASICTYPESoAVAILABLEBUTTONSINDEXvVAL ≜ INTEGERvVAL
■

ⓈZ
│ BASICTYPESoBUTTONSPRESSED ≜ BASICTYPESoAVAILABLEBUTTONSINDEX → BOOLEAN
■

ⓈZ
│ BASICTYPESoBUTTONSPRESSEDvFIRST ≜ BASICTYPESoAVAILABLEBUTTONSINDEXvFIRST
■

ⓈZ
│ BASICTYPESoBUTTONSPRESSEDvLAST ≜ BASICTYPESoAVAILABLEBUTTONSINDEXvLAST
■

ⓈZ
│ BASICTYPESoBUTTONSPRESSEDvLENGTH ≜ # BASICTYPESoAVAILABLEBUTTONSINDEX
■

ⓈZ
│ BASICTYPESoBUTTONSPRESSEDvRANGE ≜ BASICTYPESoAVAILABLEBUTTONSINDEX
■

ⓈZ
│ BASICTYPESoBRIDGEDISPLAYPOWER ≜ 0
■

ⓈZ
│ BASICTYPESoFDODISPLAYPOWER ≜ 1
■

ⓈZ
│ BASICTYPESoSHOLSELECTAUTH ≜ 2
■

ⓈZ
│ BASICTYPESoSWITCHPOSITIONSINDEX ≜
│ BASICTYPESoBRIDGEDISPLAYPOWER .. BASICTYPESoSHOLSELECTAUTH
■

ⓈZ
│ BASICTYPESoSWITCHPOSITIONSINDEXvFIRST ≜ BASICTYPESoBRIDGEDISPLAYPOWER
■

ⓈZ
│ BASICTYPESoSWITCHPOSITIONSINDEXvLAST ≜ BASICTYPESoSHOLSELECTAUTH
■

ⓈZ
│ BASICTYPESoSWITCHPOSITIONSINDEXvSUCC ≜
│ (BASICTYPESoSWITCHPOSITIONSINDEX \ {BASICTYPESoSWITCHPOSITIONSINDEXvLAST})
│     ◁ succ
■

ⓈZ
│ BASICTYPESoSWITCHPOSITIONSINDEXvPRED ≜
│ BASICTYPESoSWITCHPOSITIONSINDEXvSUCC ↗~↕
■

ⓈZ
│ BASICTYPESoSWITCHPOSITIONSINDEXvPOS ≜ id BASICTYPESoSWITCHPOSITIONSINDEX
■

ⓈZ
│ BASICTYPESoSWITCHPOSITIONSINDEXvVAL ≜
│ BASICTYPESoSWITCHPOSITIONSINDEXvPOS ↗~↕
■

ⓈZ
│ BASICTYPESoSWITCHPOSITIONS ≜ BASICTYPESoSWITCHPOSITIONSINDEX → BOOLEAN
■

ⓈZ
│ BASICTYPESoSWITCHPOSITIONSvFIRST ≜ BASICTYPESoSWITCHPOSITIONSINDEXvFIRST
■

ⓈZ
│ BASICTYPESoSWITCHPOSITIONSvLAST ≜ BASICTYPESoSWITCHPOSITIONSINDEXvLAST
■

ⓈZ
│ BASICTYPESoSWITCHPOSITIONSvLENGTH ≜ # BASICTYPESoSWITCHPOSITIONSINDEX
■

ⓈZ
│ BASICTYPESoSWITCHPOSITIONSvRANGE ≜ BASICTYPESoSWITCHPOSITIONSINDEX
■

ⓈZAX
│ BASICTYPESoGREATERTIME : BASICTYPESoTIME × BASICTYPESoTIME → BOOLEAN
├─────────────────
│ true
■

ⓈZAX
│ BASICTYPESoOTHERDISPLAY : BASICTYPESoDISPLAYPOSITION → BASICTYPESoDISPLAYPOSITION
├─────────────────
│ true
■

ⓈZAX
│ BASICTYPESoCONVERTTOANGLE : BASICTYPESoDISPLAYANGLE → BASICTYPESoANGLE
├─────────────────
│ true
■

ⓈZAX
│ BASICTYPESoCONVERTTODISPLAYANGLE :
│ BASICTYPESoANGLE → BASICTYPESoDISPLAYANGLE
├─────────────────
│ true
■

ⓈZAX
│ BASICTYPESoADDANGLES :
│ BASICTYPESoANGLE × BASICTYPESoANGLE → BASICTYPESoANGLE
├─────────────────
│ true
■

ⓈZAX
│ BASICTYPESoSUBTRACTANGLES :
│ BASICTYPESoANGLE × BASICTYPESoANGLE → BASICTYPESoANGLE
├─────────────────
│ true
■

ⓈZAX
│ BASICTYPESoADDDISPLAYANGLES :
│ BASICTYPESoDISPLAYANGLE × BASICTYPESoDISPLAYANGLE → BASICTYPESoDISPLAYANGLE
├─────────────────
│ true
■

ⓈZAX
│ BASICTYPESoSUBTRACTDISPLAYANGLES :
│ BASICTYPESoDISPLAYANGLE × BASICTYPESoDISPLAYANGLE → BASICTYPESoDISPLAYANGLE
├─────────────────
│ true
■

\newpage

\section{Alarm body}

=SML
open_theory "cn";

new_theory "Alarm_body";

open_theory "cn";

new_theory "SENSORspec";

open_theory "Alarm_body";

open_theory "cn";

new_theory "SHOLSELECTIONspec";

open_theory "Alarm_body";

new_parent "BASICTYPESspec";

new_parent "SENSORspec";

new_parent "SHOLSELECTIONspec";

(* new_parent "cache'SHOLIS_v1"; *)
=IGN
open_theory "cn";

new_theory "Alarm2_body";

new_parent "cache'sholis";

ⓈZ
│ ROLLALARM ≜ 0
■

ⓈZ
│ PITCHALARM ≜ 1
■

ⓈZ
│ WINDALARM ≜ 2
■

ⓈZ
│ ALARMTYPE ≜ ROLLALARM .. WINDALARM
■

ⓈZ
│ ALARMTYPEvFIRST ≜ ROLLALARM
■

ⓈZ
│ ALARMTYPEvLAST ≜ WINDALARM
■

ⓈZ
│ ALARMTYPEvSUCC ≜ (ALARMTYPE \ {ALARMTYPEvLAST}) ◁ succ
■

ⓈZ
│ ALARMTYPEvPRED ≜ ALARMTYPEvSUCC ↗~↕
■

ⓈZ
│ ALARMTYPEvPOS ≜ id ALARMTYPE
■

ⓈZ
│ ALARMTYPEvVAL ≜ ALARMTYPEvPOS ↗~↕
■

ⓈZ
│ NORMAL ≜ 0
■

ⓈZ
│ FLASH ≜ 1
■

ⓈZ
│ INVERSE ≜ 2
■

ⓈZ
│ ATTRIBUTE ≜ NORMAL .. INVERSE
■

ⓈZ
│ ATTRIBUTEvFIRST ≜ NORMAL
■

ⓈZ
│ ATTRIBUTEvLAST ≜ INVERSE
■

ⓈZ
│ ATTRIBUTEvSUCC ≜ (ATTRIBUTE \ {ATTRIBUTEvLAST}) ◁ succ
■

ⓈZ
│ ATTRIBUTEvPRED ≜ ATTRIBUTEvSUCC ↗~↕
■

ⓈZ
│ ATTRIBUTEvPOS ≜ id ATTRIBUTE
■

ⓈZ
│ ATTRIBUTEvVAL ≜ ATTRIBUTEvPOS ↗~↕
■

ⓈZ
│ AUDIOVISUALFLASH ≜ 0
■

ⓈZ
│ VISUALFLASH ≜ 1
■

ⓈZ
│ VISUALINVERSE ≜ 2
■

ⓈZ
│ ALARMLEVEL ≜ AUDIOVISUALFLASH .. VISUALINVERSE
■

ⓈZ
│ ALARMLEVELvFIRST ≜ AUDIOVISUALFLASH
■

ⓈZ
│ ALARMLEVELvLAST ≜ VISUALINVERSE
■

ⓈZ
│ ALARMLEVELvSUCC ≜ (ALARMLEVEL \ {ALARMLEVELvLAST}) ◁ succ
■

ⓈZ
│ ALARMLEVELvPRED ≜ ALARMLEVELvSUCC ↗~↕
■

ⓈZ
│ ALARMLEVELvPOS ≜ id ALARMLEVEL
■

ⓈZ
│ ALARMLEVELvVAL ≜ ALARMLEVELvPOS ↗~↕
■

ⓈZ
│ RESET ≜ 0
■

ⓈZ
│ NORESET ≜ 1
■

ⓈZ
│ ALARMRESET ≜ RESET .. NORESET
■

ⓈZ
│ ALARMRESETvFIRST ≜ RESET
■

ⓈZ
│ ALARMRESETvLAST ≜ NORESET
■

ⓈZ
│ ALARMRESETvSUCC ≜ (ALARMRESET \ {ALARMRESETvLAST}) ◁ succ
■

ⓈZ
│ ALARMRESETvPRED ≜ ALARMRESETvSUCC ↗~↕
■

ⓈZ
│ ALARMRESETvPOS ≜ id ALARMRESET
■

ⓈZ
│ ALARMRESETvVAL ≜ ALARMRESETvPOS ↗~↕
■

ⓈZ
│ ALARMDATA ≜ [RAISED : BOOLEAN; LEVEL : ALARMLEVEL; REOCCURS : ALARMRESET]
■

ⓈZ
│ ALARMSTATE1 ≜ ALARMTYPE → ALARMDATA
■

ⓈZ
│ ALARMSTATE1vFIRST ≜ ALARMTYPEvFIRST
■

ⓈZ
│ ALARMSTATE1vLAST ≜ ALARMTYPEvLAST
■

ⓈZ
│ ALARMSTATE1vLENGTH ≜ # ALARMTYPE
■

ⓈZ
│ ALARMSTATE1vRANGE ≜ ALARMTYPE
■

ⓈZ
│ ALARMSTATE ≜ BASICTYPESoDISPLAYPOSITION → ALARMSTATE1
■

ⓈZ
│ ALARMSTATEvFIRST ≜ BASICTYPESoDISPLAYPOSITIONvFIRST
■

ⓈZ
│ ALARMSTATEvLAST ≜ BASICTYPESoDISPLAYPOSITIONvLAST
■

ⓈZ
│ ALARMSTATEvLENGTH ≜ # BASICTYPESoDISPLAYPOSITION
■

ⓈZ
│ ALARMSTATEvRANGE ≜ BASICTYPESoDISPLAYPOSITION
■

ⓈZ
│ TIMERDATA ≜ [ACTIVE : BOOLEAN; TIMEOUT : BASICTYPESoTIME]
■

ⓈZ
│ TIMERSTATE1 ≜ ALARMTYPE → TIMERDATA
■

ⓈZ
│ TIMERSTATE1vFIRST ≜ ALARMTYPEvFIRST
■

ⓈZ
│ TIMERSTATE1vLAST ≜ ALARMTYPEvLAST
■

ⓈZ
│ TIMERSTATE1vLENGTH ≜ # ALARMTYPE
■

ⓈZ
│ TIMERSTATE1vRANGE ≜ ALARMTYPE
■

ⓈZ
│ TIMERSTATE ≜ BASICTYPESoDISPLAYPOSITION → TIMERSTATE1
■

ⓈZ
│ TIMERSTATEvFIRST ≜ BASICTYPESoDISPLAYPOSITIONvFIRST
■

ⓈZ
│ TIMERSTATEvLAST ≜ BASICTYPESoDISPLAYPOSITIONvLAST
■

ⓈZ
│ TIMERSTATEvLENGTH ≜ # BASICTYPESoDISPLAYPOSITION
■

ⓈZ
│ TIMERSTATEvRANGE ≜ BASICTYPESoDISPLAYPOSITION
■

ⓈZ
│ TIMEOUTPERIOD ≜ 300 * BASICTYPESoTICKSPERSEC
■

ⓈZAX
│ DisplayAttribute : ALARMSTATE × BASICTYPESoDISPLAYPOSITION × ALARMTYPE → ATTRIBUTE
├─────────────────
│ ∀ STATE : ALARMSTATE; DISPLAY : BASICTYPESoDISPLAYPOSITION; ATYPE : ALARMTYPE
│   ⦁ ((STATE DISPLAY ATYPE).RAISED = FALSE
│       ⇒ DisplayAttribute (STATE, DISPLAY, ATYPE) = NORMAL)
│     ∧ ((STATE DISPLAY ATYPE).RAISED = TRUE
│         ∧ (STATE DISPLAY ATYPE).LEVEL = VISUALINVERSE
│       ⇒ DisplayAttribute (STATE, DISPLAY, ATYPE) = INVERSE)
│     ∧ ((STATE DISPLAY ATYPE).RAISED = TRUE
│         ∧ (STATE DISPLAY ATYPE).LEVEL ≠ VISUALINVERSE
│       ⇒ DisplayAttribute (STATE, DISPLAY, ATYPE) = FLASH)
■

ⓈZAX
│ DISPLAYATTRIBUTE : BASICTYPESoDISPLAYPOSITION × ALARMTYPE → ATTRIBUTE
├─────────────────
│ true
■

ⓈZ
│ vc501_1 ?⊢
│     ∀ STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | true ∧ not (STATE DISPLAY ATYPE).RAISED = TRUE
│       ⦁ NORMAL = DisplayAttribute (STATE, DISPLAY, ATYPE)
■

ⓈZ
│ vc501_2 ?⊢
│     ∀ STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | true
│         ∧ not (STATE DISPLAY ATYPE).RAISED = FALSE
│         ∧ (STATE DISPLAY ATYPE).LEVEL eq VISUALINVERSE = TRUE
│       ⦁ INVERSE = DisplayAttribute (STATE, DISPLAY, ATYPE)
■

ⓈZ
│ vc501_3 ?⊢
│     ∀ STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | true
│         ∧ not (STATE DISPLAY ATYPE).RAISED = FALSE
│         ∧ (STATE DISPLAY ATYPE).LEVEL eq VISUALINVERSE = FALSE
│       ⦁ FLASH = DisplayAttribute (STATE, DISPLAY, ATYPE)
■

┌ AlarmChange ────────
│ STATE⋎0, STATE : ALARMSTATE;
│ TIMERS⋎0, TIMERS : TIMERSTATE;
│ DISPLAY : BASICTYPESoDISPLAYPOSITION;
│ ATYPE : ALARMTYPE
├─────────────────
│ true
└─────────────────

┌ TimerInvariant ────────
│ STATE : ALARMSTATE;
│ TIMERS : TIMERSTATE;
│ DISPLAY : BASICTYPESoDISPLAYPOSITION;
│ ATYPE : ALARMTYPE
├─────────────────
│ (TIMERS DISPLAY ATYPE).ACTIVE = TRUE
│   ⇔ (STATE DISPLAY ATYPE).RAISED = TRUE
│     ∧ (STATE DISPLAY ATYPE).LEVEL ≠ AUDIOVISUALFLASH
│     ∧ (STATE DISPLAY ATYPE).REOCCURS = NORESET
└─────────────────

ⓈZAX
│ InactiveAlarms : ALARMSTATE × TIMERSTATE × BASICTYPESoDISPLAYPOSITION → ℙ ALARMTYPE
├─────────────────
│ ∀ STATE : ALARMSTATE;
│     TIMERS : TIMERSTATE;
│     DISPLAY : BASICTYPESoDISPLAYPOSITION;
│     ATYPE : ALARMTYPE
│   ⦁ ATYPE ∈ InactiveAlarms (STATE, TIMERS, DISPLAY)
│     ⇔ (STATE DISPLAY ATYPE).RAISED = FALSE
■

ⓈZAX
│ AcceptedAlarms : ALARMSTATE × TIMERSTATE × BASICTYPESoDISPLAYPOSITION → ℙ ALARMTYPE
├─────────────────
│ ∀ STATE : ALARMSTATE;
│     TIMERS : TIMERSTATE;
│     DISPLAY : BASICTYPESoDISPLAYPOSITION;
│     ATYPE : ALARMTYPE
│   ⦁ ATYPE ∈ AcceptedAlarms (STATE, TIMERS, DISPLAY)
│     ⇔ (STATE DISPLAY ATYPE).RAISED = TRUE
│       ∧ (STATE DISPLAY ATYPE).LEVEL = VISUALINVERSE
■

ⓈZAX
│ NonAcceptedAlarms : ALARMSTATE × TIMERSTATE × BASICTYPESoDISPLAYPOSITION → ℙ ALARMTYPE
├─────────────────
│ ∀ STATE : ALARMSTATE;
│     TIMERS : TIMERSTATE;
│     DISPLAY : BASICTYPESoDISPLAYPOSITION;
│     ATYPE : ALARMTYPE
│   ⦁ ATYPE ∈ NonAcceptedAlarms (STATE, TIMERS, DISPLAY)
│     ⇔ (STATE DISPLAY ATYPE).RAISED = TRUE
│       ∧ (STATE DISPLAY ATYPE).LEVEL ≠ VISUALINVERSE
■

ⓈZAX
│ WithinTimeoutAlarms : ALARMSTATE × TIMERSTATE × BASICTYPESoDISPLAYPOSITION → ℙ ALARMTYPE
├─────────────────
│ ∀ STATE : ALARMSTATE;
│     TIMERS : TIMERSTATE;
│     DISPLAY : BASICTYPESoDISPLAYPOSITION;
│     ATYPE : ALARMTYPE
│   ⦁ ATYPE ∈ WithinTimeoutAlarms (STATE, TIMERS, DISPLAY)
│     ⇔ (STATE DISPLAY ATYPE).RAISED = TRUE ∧ (TIMERS DISPLAY ATYPE).ACTIVE = TRUE
■

ⓈZAX
│ TimedOutAlarms : ALARMSTATE × TIMERSTATE × BASICTYPESoDISPLAYPOSITION → ℙ ALARMTYPE
├─────────────────
│ ∀ STATE : ALARMSTATE;
│     TIMERS : TIMERSTATE;
│     DISPLAY : BASICTYPESoDISPLAYPOSITION;
│     ATYPE : ALARMTYPE
│   ⦁ ATYPE ∈ TimedOutAlarms (STATE, TIMERS, DISPLAY)
│     ⇔ (STATE DISPLAY ATYPE).RAISED = TRUE
│       ∧ (STATE DISPLAY ATYPE).REOCCURS = RESET
│       ∧ (TIMERS DISPLAY ATYPE).ACTIVE = FALSE
■

ⓈZAX
│ AudioVisualFlashAlarms : ALARMSTATE × TIMERSTATE × BASICTYPESoDISPLAYPOSITION → ℙ ALARMTYPE
├─────────────────
│ ∀ STATE : ALARMSTATE;
│     TIMERS : TIMERSTATE;
│     DISPLAY : BASICTYPESoDISPLAYPOSITION;
│     ATYPE : ALARMTYPE
│   ⦁ ATYPE ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY)
│     ⇔ (STATE DISPLAY ATYPE).RAISED = TRUE
│       ∧ (STATE DISPLAY ATYPE).LEVEL = AUDIOVISUALFLASH
│       ∧ (TIMERS DISPLAY ATYPE).ACTIVE = FALSE
■

ⓈZAX
│ VisualFlashAlarms : ALARMSTATE × TIMERSTATE × BASICTYPESoDISPLAYPOSITION → ℙ ALARMTYPE
├─────────────────
│ ∀ STATE : ALARMSTATE;
│     TIMERS : TIMERSTATE;
│     DISPLAY : BASICTYPESoDISPLAYPOSITION;
│     ATYPE : ALARMTYPE
│   ⦁ ATYPE ∈ VisualFlashAlarms (STATE, TIMERS, DISPLAY)
│     ⇔ (STATE DISPLAY ATYPE).RAISED = TRUE
│       ∧ (STATE DISPLAY ATYPE).LEVEL = VISUALFLASH
■

ⓈZAX
│ AUDIOVISUALFLASHALARMEXISTS : BASICTYPESoDISPLAYPOSITION → BOOLEAN
├─────────────────
│ true
■

ⓈZ
│ vc701_1 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (∀ ATYPE : ALARMTYPE ⦁ TimerInvariant)
│         ∧ ALARMTYPEvFIRST ≤ ALARMTYPEvLAST
│       ⦁ (∀ ATYPE : ALARMTYPE ⦁ TimerInvariant)
│         ∧ ((∃ I : ALARMTYPEvFIRST .. ALARMTYPEvFIRST - 1
│             ⦁ I ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ FALSE = TRUE)
■

ⓈZ
│ vc701_2 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (∀ ATYPE : ALARMTYPE ⦁ TimerInvariant)
│         ∧ ALARMTYPEvFIRST > ALARMTYPEvLAST
│       ⦁ FALSE = TRUE
│         ⇔ (∃ ATYPE : ALARMTYPE
│           ⦁ ATYPE ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY))
■

ⓈZ
│ vc701_3 ?⊢
│     ∀ AUDIOVFEXISTS : BOOLEAN;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | (∀ ATYPE : ALARMTYPE ⦁ TimerInvariant)
│         ∧ ATYPE ≠ ALARMTYPEvLAST
│         ∧ (∀ ATYPE : ALARMTYPE ⦁ TimerInvariant)
│         ∧ ((∃ I : ALARMTYPEvFIRST .. ATYPE
│             ⦁ I ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ AUDIOVFEXISTS = TRUE)
│       ⦁ (∀ ATYPE : ALARMTYPE ⦁ TimerInvariant)
│         ∧ ((∃ I : ALARMTYPEvFIRST .. (ATYPE + 1) - 1
│             ⦁ I ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ AUDIOVFEXISTS = TRUE)
■

ⓈZ
│ vc701_4 ?⊢
│     ∀ AUDIOVFEXISTS : BOOLEAN;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (∀ ATYPE : ALARMTYPE ⦁ TimerInvariant)
│         ∧ (∀ ATYPE : ALARMTYPE ⦁ TimerInvariant)
│         ∧ ((∃ I : ALARMTYPEvFIRST .. ALARMTYPEvLAST
│             ⦁ I ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ AUDIOVFEXISTS = TRUE)
│       ⦁ AUDIOVFEXISTS = TRUE
│         ⇔ (∃ ATYPE : ALARMTYPE
│           ⦁ ATYPE ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY))
■

ⓈZ
│ vc702_1 ?⊢
│     ∀ AUDIOVFEXISTS : BOOLEAN;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | ((∀ ATYPE : ALARMTYPE ⦁ TimerInvariant)
│         ∧ ((∃ I : ALARMTYPEvFIRST .. ATYPE - 1
│             ⦁ I ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ AUDIOVFEXISTS = TRUE))
│         ∧ (STATE DISPLAY ATYPE).RAISED
│               and (STATE DISPLAY ATYPE).LEVEL eq AUDIOVISUALFLASH
│           = TRUE
│       ⦁ (∀ ATYPE : ALARMTYPE ⦁ TimerInvariant)
│         ∧ ((∃ I : ALARMTYPEvFIRST .. ATYPE
│             ⦁ I ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ TRUE = TRUE)
■

ⓈZ
│ vc702_2 ?⊢
│     ∀ AUDIOVFEXISTS : BOOLEAN;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | ((∀ ATYPE : ALARMTYPE ⦁ TimerInvariant)
│         ∧ ((∃ I : ALARMTYPEvFIRST .. ATYPE - 1
│             ⦁ I ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ AUDIOVFEXISTS = TRUE))
│         ∧ (STATE DISPLAY ATYPE).RAISED
│               and (STATE DISPLAY ATYPE).LEVEL eq AUDIOVISUALFLASH
│           = FALSE
│       ⦁ (∀ ATYPE : ALARMTYPE ⦁ TimerInvariant)
│         ∧ ((∃ I : ALARMTYPEvFIRST .. ATYPE
│             ⦁ I ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ AUDIOVFEXISTS = TRUE)
■

┌ RaiseNewAlarm ────────
│ AlarmChange
├─────────────────
│ ATYPE ∈ InactiveAlarms (STATE⋎0, TIMERS⋎0, DISPLAY)
│   ⇒ ATYPE ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY)
└─────────────────

┌ RaiseWithinTimeoutAlarm ────────
│ AlarmChange
├─────────────────
│ ATYPE ∈ WithinTimeoutAlarms (STATE⋎0, TIMERS⋎0, DISPLAY)
│   ⇒ ATYPE ∈ WithinTimeoutAlarms (STATE, TIMERS, DISPLAY)
│     ∧ ATYPE ∈ VisualFlashAlarms (STATE, TIMERS, DISPLAY)
└─────────────────

┌ RaiseAudioVisualFlashAlarm ────────
│ AlarmChange
├─────────────────
│ ATYPE ∈ AudioVisualFlashAlarms (STATE⋎0, TIMERS⋎0, DISPLAY)
│   ⇒ ATYPE ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY)
└─────────────────

┌ RaiseTimedOutAlarm ────────
│ AlarmChange
├─────────────────
│ ATYPE ∈ TimedOutAlarms (STATE⋎0, TIMERS⋎0, DISPLAY)
│   ⇒ ATYPE ∈ AudioVisualFlashAlarms (STATE, TIMERS, DISPLAY)
└─────────────────

ⓈZ
│ RaiseAlarm ≜
│ RaiseNewAlarm
│   ∧ RaiseWithinTimeoutAlarm
│   ∧ RaiseAudioVisualFlashAlarm
│   ∧ RaiseTimedOutAlarm
■

ⓈZ
│ vc807_1 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | TimerInvariant ∧ not (STATE DISPLAY ATYPE).RAISED = TRUE
│       ⦁ (ATYPE ≜ ATYPE, DISPLAY ≜ DISPLAY,
│             STATE ≜
│                 STATE
│                     ⊕ {DISPLAY
│                           ↦ STATE DISPLAY
│                               ⊕ {ATYPE
│                                     ↦ (LEVEL ≜ AUDIOVISUALFLASH, RAISED ≜ TRUE,
│                                         REOCCURS ≜ NORESET)}}, STATE⋎0 ≜ STATE,
│             TIMERS ≜ TIMERS, TIMERS⋎0 ≜ TIMERS)
│         ∈ RaiseAlarm
■

ⓈZ
│ vc807_2 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | TimerInvariant
│         ∧ not (STATE DISPLAY ATYPE).RAISED = FALSE
│         ∧ (STATE DISPLAY ATYPE).REOCCURS eq RESET = TRUE
│       ⦁ (ATYPE ≜ ATYPE, DISPLAY ≜ DISPLAY,
│             STATE ≜
│                 STATE
│                     ⊕ {DISPLAY
│                           ↦ STATE DISPLAY
│                               ⊕ {ATYPE
│                                     ↦ (LEVEL ≜ AUDIOVISUALFLASH, RAISED ≜ TRUE,
│                                         REOCCURS ≜ NORESET)}}, STATE⋎0 ≜ STATE,
│             TIMERS ≜ TIMERS, TIMERS⋎0 ≜ TIMERS)
│         ∈ RaiseAlarm
■

ⓈZ
│ vc807_3 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | TimerInvariant
│         ∧ not (STATE DISPLAY ATYPE).RAISED = FALSE
│         ∧ (STATE DISPLAY ATYPE).REOCCURS eq RESET = FALSE
│         ∧ (STATE DISPLAY ATYPE).LEVEL eq VISUALINVERSE = TRUE
│       ⦁ (ATYPE ≜ ATYPE, DISPLAY ≜ DISPLAY,
│             STATE ≜
│                 STATE
│                     ⊕ {DISPLAY
│                           ↦ STATE DISPLAY
│                               ⊕ {ATYPE
│                                     ↦ (LEVEL ≜ VISUALFLASH, RAISED ≜ TRUE,
│                                         REOCCURS ≜ NORESET)}}, STATE⋎0 ≜ STATE,
│             TIMERS ≜ TIMERS, TIMERS⋎0 ≜ TIMERS)
│         ∈ RaiseAlarm
■

ⓈZ
│ vc807_4 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | TimerInvariant
│         ∧ not (STATE DISPLAY ATYPE).RAISED = FALSE
│         ∧ (STATE DISPLAY ATYPE).REOCCURS eq RESET = FALSE
│         ∧ (STATE DISPLAY ATYPE).LEVEL eq VISUALINVERSE = FALSE
│       ⦁ (ATYPE ≜ ATYPE, DISPLAY ≜ DISPLAY, STATE ≜ STATE, STATE⋎0 ≜ STATE,
│             TIMERS ≜ TIMERS, TIMERS⋎0 ≜ TIMERS)
│         ∈ RaiseAlarm
■

┌ TimeoutAlarm ────────
│ AlarmChange;
│ CURRENTTIME : BASICTYPESoTIME
├─────────────────
│ ATYPE ∈ WithinTimeoutAlarms (STATE⋎0, TIMERS⋎0, DISPLAY)
│     ∧ (CURRENTTIME - (TIMERS⋎0 DISPLAY ATYPE).TIMEOUT)
│           intmod (BASICTYPESoTIMEvLAST + 1)
│         < 1 * BASICTYPESoTICKSPERSEC
│   ⇒ ATYPE ∈ TimedOutAlarms (STATE, TIMERS, DISPLAY)
└─────────────────

ⓈZ
│ vc901_1 ?⊢
│     true ⇒ true
■

ⓈZ
│ vc901_2 ?⊢
│     ∀ TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE;
│         CURRENTTIME : BASICTYPESoTIME
│       | true
│         ∧ (ATYPE ∈ WithinTimeoutAlarms (STATE⋎0, TIMERS⋎0, DISPLAY)
│             ∧ (CURRENTTIME - (TIMERS⋎0 DISPLAY ATYPE).TIMEOUT ≥ 0
│                 ∧ CURRENTTIME - (TIMERS⋎0 DISPLAY ATYPE).TIMEOUT
│                     < 1 * BASICTYPESoTICKSPERSEC
│               ∨ CURRENTTIME - (TIMERS⋎0 DISPLAY ATYPE).TIMEOUT < 0
│                 ∧ (CURRENTTIME - (TIMERS⋎0 DISPLAY ATYPE).TIMEOUT)
│                       + BASICTYPESoTIMEvLAST + 1
│                     < 1 * BASICTYPESoTICKSPERSEC)
│           ⇒ ATYPE ∈ TimedOutAlarms (STATE, TIMERS, DISPLAY))
│       ⦁ TimeoutAlarm
■

ⓈZ
│ vc902_1 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE;
│         CURRENTTIME : BASICTYPESoTIME
│       | true
│         ∧ (TIMERS DISPLAY ATYPE).ACTIVE
│               and ((TIMERS DISPLAY ATYPE).TIMEOUT less_eq CURRENTTIME
│                     and CURRENTTIME - (TIMERS DISPLAY ATYPE).TIMEOUT
│                         less 30 * BASICTYPESoTICKSPERSEC)
│                   or (TIMERS DISPLAY ATYPE).TIMEOUT greater CURRENTTIME
│                       and (TIMERS DISPLAY ATYPE).TIMEOUT - CURRENTTIME
│                           greater_eq BASICTYPESoTIMEvLAST
│                               - 30 * BASICTYPESoTICKSPERSEC
│           = TRUE
│       ⦁ ATYPE ∈ WithinTimeoutAlarms (STATE, TIMERS, DISPLAY)
│           ∧ (CURRENTTIME - (TIMERS DISPLAY ATYPE).TIMEOUT ≥ 0
│               ∧ CURRENTTIME - (TIMERS DISPLAY ATYPE).TIMEOUT
│                   < 1 * BASICTYPESoTICKSPERSEC
│             ∨ CURRENTTIME - (TIMERS DISPLAY ATYPE).TIMEOUT < 0
│               ∧ (CURRENTTIME - (TIMERS DISPLAY ATYPE).TIMEOUT)
│                     + BASICTYPESoTIMEvLAST + 1
│                   < 1 * BASICTYPESoTICKSPERSEC)
│         ⇒ ATYPE
│           ∈ TimedOutAlarms
│               (STATE
│                     ⊕ {DISPLAY
│                           ↦ STATE DISPLAY
│                               ⊕ {ATYPE
│                                     ↦ (LEVEL ≜ (STATE DISPLAY ATYPE).LEVEL,
│                                         RAISED ≜ (STATE DISPLAY ATYPE).RAISED,
│                                         REOCCURS ≜ RESET)}},
│                 TIMERS
│                     ⊕ {DISPLAY
│                           ↦ TIMERS DISPLAY
│                               ⊕ {ATYPE
│                                     ↦ (ACTIVE ≜ FALSE,
│                                         TIMEOUT ≜
│                                             (TIMERS DISPLAY ATYPE).TIMEOUT)}},
│                 DISPLAY)
■

ⓈZ
│ vc902_2 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE;
│         CURRENTTIME : BASICTYPESoTIME
│       | true
│         ∧ (TIMERS DISPLAY ATYPE).ACTIVE
│               and ((TIMERS DISPLAY ATYPE).TIMEOUT less_eq CURRENTTIME
│                     and CURRENTTIME - (TIMERS DISPLAY ATYPE).TIMEOUT
│                         less 30 * BASICTYPESoTICKSPERSEC)
│                   or (TIMERS DISPLAY ATYPE).TIMEOUT greater CURRENTTIME
│                       and (TIMERS DISPLAY ATYPE).TIMEOUT - CURRENTTIME
│                           greater_eq BASICTYPESoTIMEvLAST
│                               - 30 * BASICTYPESoTICKSPERSEC
│           = FALSE
│       ⦁ ATYPE ∈ WithinTimeoutAlarms (STATE, TIMERS, DISPLAY)
│           ∧ (CURRENTTIME - (TIMERS DISPLAY ATYPE).TIMEOUT ≥ 0
│               ∧ CURRENTTIME - (TIMERS DISPLAY ATYPE).TIMEOUT
│                   < 1 * BASICTYPESoTICKSPERSEC
│             ∨ CURRENTTIME - (TIMERS DISPLAY ATYPE).TIMEOUT < 0
│               ∧ (CURRENTTIME - (TIMERS DISPLAY ATYPE).TIMEOUT)
│                     + BASICTYPESoTIMEvLAST + 1
│                   < 1 * BASICTYPESoTICKSPERSEC)
│         ⇒ ATYPE ∈ TimedOutAlarms (STATE, TIMERS, DISPLAY)
■

ⓈZ
│ vc1001_1 ?⊢
│     true
│       ⇒ (∀ DISPLAY : BASICTYPESoDISPLAYPOSITION; ATYPE : ALARMTYPE
│         ⦁ ATYPE
│           ∈ InactiveAlarms
│               (ALARMSTATEvRANGE
│                   × {ALARMSTATE1vRANGE
│                       × {(LEVEL ≜ ALARMLEVELvFIRST, RAISED ≜ FALSE,
│                             REOCCURS ≜ ALARMRESETvFIRST)}},
│                 TIMERSTATEvRANGE
│                   × {TIMERSTATE1vRANGE
│                       × {(ACTIVE ≜ FALSE, TIMEOUT ≜ BASICTYPESoTIMEvLAST)}},
│                 DISPLAY))
■

ⓈZ
│ vc11_1 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | true ∧ ALARMTYPEvFIRST ≤ ALARMTYPEvLAST
│       ⦁ ∀ I : ALARMTYPEvFIRST .. ALARMTYPEvFIRST - 1
│         ⦁ I ∈ InactiveAlarms (STATE, TIMERS, DISPLAY)
■

ⓈZ
│ vc11_2 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | true ∧ ALARMTYPEvFIRST > ALARMTYPEvLAST
│       ⦁ ∀ ATYPE : ALARMTYPE ⦁ ATYPE ∈ InactiveAlarms (STATE, TIMERS, DISPLAY)
■

ⓈZ
│ vc11_3 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | true
│         ∧ ATYPE ≠ ALARMTYPEvLAST
│         ∧ (∀ I : ALARMTYPEvFIRST .. ATYPE
│           ⦁ I ∈ InactiveAlarms (STATE, TIMERS, DISPLAY))
│       ⦁ ∀ I : ALARMTYPEvFIRST .. (ATYPE + 1) - 1
│         ⦁ I ∈ InactiveAlarms (STATE, TIMERS, DISPLAY)
■

ⓈZ
│ vc11_4 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | true
│         ∧ (∀ I : ALARMTYPEvFIRST .. ALARMTYPEvLAST
│           ⦁ I ∈ InactiveAlarms (STATE, TIMERS, DISPLAY))
│       ⦁ ∀ ATYPE : ALARMTYPE ⦁ ATYPE ∈ InactiveAlarms (STATE, TIMERS, DISPLAY)
■

ⓈZ
│ vc1101_1 ?⊢
│     ∀ TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         ATYPE : ALARMTYPE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | ∀ I : ALARMTYPEvFIRST .. ATYPE - 1
│         ⦁ I ∈ InactiveAlarms (STATE, TIMERS, DISPLAY)
│       ⦁ ∀ I : ALARMTYPEvFIRST .. ATYPE
│         ⦁ I
│           ∈ InactiveAlarms
│               (STATE
│                     ⊕ {DISPLAY
│                           ↦ STATE DISPLAY
│                               ⊕ {ATYPE
│                                     ↦ (LEVEL ≜ (STATE DISPLAY ATYPE).LEVEL,
│                                         RAISED ≜ FALSE,
│                                         REOCCURS ≜
│                                             (STATE DISPLAY ATYPE).REOCCURS)}},
│                 TIMERS
│                     ⊕ {DISPLAY
│                           ↦ TIMERS DISPLAY
│                               ⊕ {ATYPE
│                                     ↦ (ACTIVE ≜ FALSE,
│                                         TIMEOUT ≜
│                                             (TIMERS DISPLAY ATYPE).TIMEOUT)}},
│                 DISPLAY)
■

┌ FirstAcceptance ────────
│ AlarmChange
├─────────────────
│ ATYPE ∈ NonAcceptedAlarms (STATE⋎0, TIMERS⋎0, DISPLAY)
│   ⇒ ATYPE ∈ AcceptedAlarms (STATE, TIMERS, DISPLAY);
│ ATYPE ∈ AudioVisualFlashAlarms (STATE⋎0, TIMERS⋎0, DISPLAY)
│   ⇒ ATYPE ∈ WithinTimeoutAlarms (STATE, TIMERS, DISPLAY)
└─────────────────

┌ SecondAcceptance ────────
│ AlarmChange
├─────────────────
│ ¬
│     (∃ ATYPE1 : ALARMTYPE
│         ⦁ ATYPE1 ∈ NonAcceptedAlarms (STATE⋎0, TIMERS⋎0, DISPLAY))
│     ∧ ATYPE ∈ AcceptedAlarms (STATE⋎0, TIMERS⋎0, DISPLAY)
│   ⇒ ATYPE ∈ InactiveAlarms (STATE, TIMERS, DISPLAY)
└─────────────────

┌ NoAcceptance ────────
│ AlarmChange
├─────────────────
│ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (STATE⋎0, TIMERS⋎0, DISPLAY))
│     ∧ ATYPE ∈ AcceptedAlarms (STATE⋎0, TIMERS⋎0, DISPLAY)
│   ⇒ ATYPE ∈ AcceptedAlarms (STATE, TIMERS, DISPLAY)
└─────────────────

┌ InactiveAcceptance ────────
│ AlarmChange
├─────────────────
│ ATYPE ∈ InactiveAlarms (STATE⋎0, TIMERS⋎0, DISPLAY)
│   ⇒ ATYPE ∈ InactiveAlarms (STATE, TIMERS, DISPLAY)
└─────────────────

ⓈZ
│ AcceptAlarm ≜
│ FirstAcceptance ∧ SecondAcceptance ∧ NoAcceptance ∧ InactiveAcceptance
■

ⓈZ
│ vc1202_1 ?⊢
│     true ⇒ true
■

ⓈZ
│ vc1202_2 ?⊢
│     ∀ S : ALARMSTATE;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | true ∧ S = STATE⋎0 ∧ (∀ ATYPE : ALARMTYPE ⦁ (AcceptAlarm [S/STATE⋎0]))
│       ⦁ ∀ ATYPE : ALARMTYPE ⦁ AcceptAlarm
■

ⓈZ
│ vc1203_1 ?⊢
│     ∀ S : ALARMSTATE; STATE : ALARMSTATE | S = STATE ⦁ S = STATE
■

ⓈZ
│ vc1203_2 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | S = STATE⋎0
│         ∧ T = TIMERS⋎0
│         ∧ (∀ ATYPE : ALARMTYPE ⦁ (AcceptAlarm [S/STATE⋎0, T/TIMERS⋎0]))
│       ⦁ ∀ ATYPE : ALARMTYPE ⦁ (AcceptAlarm [S/STATE⋎0])
■

ⓈZ
│ vc1204_1 ?⊢
│     ∀ S : ALARMSTATE; T : TIMERSTATE; TIMERS : TIMERSTATE; STATE : ALARMSTATE
│       | T = TIMERS ∧ S = STATE
│       ⦁ S = STATE ∧ T = TIMERS
■

ⓈZ
│ vc1204_2 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         NONVIEXISTS : BOOLEAN;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (T = TIMERS⋎0
│         ∧ S = STATE⋎0)
│         ∧ S = STATE
│         ∧ T = TIMERS
│         ∧ ((∃ ATYPE1 : ALARMTYPE
│             ⦁ ATYPE1 ∈ NonAcceptedAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ NONVIEXISTS = TRUE)
│       ⦁ S = STATE
│         ∧ T = TIMERS
│         ∧ ((∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│           ⇔ NONVIEXISTS = TRUE)
■

ⓈZ
│ vc1204_3 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (T = TIMERS⋎0
│         ∧ S = STATE⋎0)
│         ∧ (∀ ATYPE : ALARMTYPE ⦁ (AcceptAlarm [S/STATE⋎0, T/TIMERS⋎0]))
│       ⦁ ∀ ATYPE : ALARMTYPE ⦁ (AcceptAlarm [S/STATE⋎0, T/TIMERS⋎0])
■

ⓈZ
│ vc1205_1 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE ∧ T = TIMERS) ∧ ALARMTYPEvFIRST ≤ ALARMTYPEvLAST
│       ⦁ (∃ I : ALARMTYPEvFIRST .. ALARMTYPEvFIRST - 1
│           ⦁ I ∈ NonAcceptedAlarms (STATE, TIMERS, DISPLAY))
│         ⇔ FALSE = TRUE
■

ⓈZ
│ vc1205_2 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE ∧ T = TIMERS) ∧ ALARMTYPEvFIRST > ALARMTYPEvLAST
│       ⦁ S = STATE
│         ∧ T = TIMERS
│         ∧ ((∃ ATYPE1 : ALARMTYPE
│             ⦁ ATYPE1 ∈ NonAcceptedAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ FALSE = TRUE)
■

ⓈZ
│ vc1205_3 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         NONVIEXISTS : BOOLEAN;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | (S = STATE
│         ∧ T = TIMERS)
│         ∧ ATYPE ≠ ALARMTYPEvLAST
│         ∧ ((∃ I : ALARMTYPEvFIRST .. ATYPE
│             ⦁ I ∈ NonAcceptedAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ NONVIEXISTS = TRUE)
│       ⦁ (∃ I : ALARMTYPEvFIRST .. (ATYPE + 1) - 1
│           ⦁ I ∈ NonAcceptedAlarms (STATE, TIMERS, DISPLAY))
│         ⇔ NONVIEXISTS = TRUE
■

ⓈZ
│ vc1205_4 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         NONVIEXISTS : BOOLEAN;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE
│         ∧ T = TIMERS)
│         ∧ ((∃ I : ALARMTYPEvFIRST .. ALARMTYPEvLAST
│             ⦁ I ∈ NonAcceptedAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ NONVIEXISTS = TRUE)
│       ⦁ S = STATE
│         ∧ T = TIMERS
│         ∧ ((∃ ATYPE1 : ALARMTYPE
│             ⦁ ATYPE1 ∈ NonAcceptedAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ NONVIEXISTS = TRUE)
■

ⓈZ
│ vc120501_1 ?⊢
│     ∀ NONVIEXISTS : BOOLEAN;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | ((∃ I : ALARMTYPEvFIRST .. ATYPE - 1
│             ⦁ I ∈ NonAcceptedAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ NONVIEXISTS = TRUE)
│         ∧ (STATE DISPLAY ATYPE).RAISED
│               and (STATE DISPLAY ATYPE).LEVEL noteq VISUALINVERSE
│           = TRUE
│       ⦁ (∃ I : ALARMTYPEvFIRST .. ATYPE
│           ⦁ I ∈ NonAcceptedAlarms (STATE, TIMERS, DISPLAY))
│         ⇔ TRUE = TRUE
■

ⓈZ
│ vc120501_2 ?⊢
│     ∀ NONVIEXISTS : BOOLEAN;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | ((∃ I : ALARMTYPEvFIRST .. ATYPE - 1
│             ⦁ I ∈ NonAcceptedAlarms (STATE, TIMERS, DISPLAY))
│           ⇔ NONVIEXISTS = TRUE)
│         ∧ (STATE DISPLAY ATYPE).RAISED
│               and (STATE DISPLAY ATYPE).LEVEL noteq VISUALINVERSE
│           = FALSE
│       ⦁ (∃ I : ALARMTYPEvFIRST .. ATYPE
│           ⦁ I ∈ NonAcceptedAlarms (STATE, TIMERS, DISPLAY))
│         ⇔ NONVIEXISTS = TRUE
■

ⓈZ
│ vc1206_1 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         NONVIEXISTS : BOOLEAN;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE
│         ∧ T = TIMERS
│         ∧ ((∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│           ⇔ NONVIEXISTS = TRUE))
│         ∧ NONVIEXISTS = TRUE
│       ⦁ S = STATE
│         ∧ T = TIMERS
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
■

ⓈZ
│ vc1206_2 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         NONVIEXISTS : BOOLEAN;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE
│         ∧ T = TIMERS
│         ∧ ((∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│           ⇔ NONVIEXISTS = TRUE))
│         ∧ NONVIEXISTS = FALSE
│       ⦁ S = STATE
│         ∧ T = TIMERS
│         ∧ ¬
│         (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
■

ⓈZ
│ vc1206_3 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         NONVIEXISTS : BOOLEAN;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE⋎0
│         ∧ T = TIMERS⋎0
│         ∧ ((∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│           ⇔ NONVIEXISTS = TRUE))
│         ∧ (∀ ATYPE : ALARMTYPE ⦁ (AcceptAlarm [S/STATE⋎0, T/TIMERS⋎0]))
│       ⦁ ∀ ATYPE : ALARMTYPE ⦁ (AcceptAlarm [S/STATE⋎0, T/TIMERS⋎0])
■

ⓈZ
│ vc1206_4 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         NONVIEXISTS : BOOLEAN;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE⋎0
│         ∧ T = TIMERS⋎0
│         ∧ ((∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│           ⇔ NONVIEXISTS = TRUE))
│         ∧ (∀ ATYPE : ALARMTYPE ⦁ (AcceptAlarm [S/STATE⋎0, T/TIMERS⋎0]))
│       ⦁ ∀ ATYPE : ALARMTYPE ⦁ (AcceptAlarm [S/STATE⋎0, T/TIMERS⋎0])
■

ⓈZ
│ vc1207_1 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | S = STATE
│         ∧ T = TIMERS
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│       ⦁ S = STATE
│         ∧ T = TIMERS
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
■

ⓈZ
│ vc1207_2 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE⋎0
│         ∧ T = TIMERS⋎0
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ (∀ ATYPE : ALARMTYPE
│           ⦁ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│               [S/STATE⋎0,
│               T/TIMERS⋎0]))
│       ⦁ ∀ ATYPE : ALARMTYPE ⦁ (AcceptAlarm [S/STATE⋎0, T/TIMERS⋎0])
■

ⓈZ
│ vc120701_1 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | S = STATE
│         ∧ T = TIMERS
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│       ⦁ S = STATE
│         ∧ T = TIMERS
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
■

ⓈZ
│ vc120701_2 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE⋎0
│         ∧ T = TIMERS⋎0
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ S = STATE
│         ∧ T = TIMERS
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│       ⦁ S = STATE
│         ∧ T = TIMERS
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
■

ⓈZ
│ vc120701_3 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE⋎0
│         ∧ T = TIMERS⋎0
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ (∀ ATYPE : ALARMTYPE
│           ⦁ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│               [S/STATE⋎0,
│               T/TIMERS⋎0]))
│       ⦁ ∀ ATYPE : ALARMTYPE
│         ⦁ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│             [S/STATE⋎0,
│             T/TIMERS⋎0])
■

ⓈZ
│ vc120702_1 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | S = STATE
│         ∧ T = TIMERS
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│       ⦁ true
■

ⓈZ
│ vc120702_2 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE
│         ∧ T = TIMERS
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ true
│       ⦁ S = STATE
│         ∧ T = TIMERS
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
■

ⓈZ
│ vc120703_1 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE
│         ∧ T = TIMERS
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ ALARMTYPEvFIRST ≤ ALARMTYPEvLAST
│       ⦁ (∀ I : ALARMTYPEvFIRST .. ALARMTYPEvLAST
│           ⦁ STATE DISPLAY I = S DISPLAY I ∧ TIMERS DISPLAY I = T DISPLAY I)
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│         ∧ (∀ I : ALARMTYPEvFIRST .. ALARMTYPEvFIRST - 1
│           ⦁ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│               [I/ATYPE,
│               S/STATE⋎0,
│               T/TIMERS⋎0]))
■

ⓈZ
│ vc120703_2 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE
│         ∧ T = TIMERS
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ ALARMTYPEvFIRST > ALARMTYPEvLAST
│       ⦁ ∀ ATYPE : ALARMTYPE
│         ⦁ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│             [S/STATE⋎0,
│             T/TIMERS⋎0])
■

ⓈZ
│ vc120703_3 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | (S = STATE⋎0
│         ∧ T = TIMERS⋎0
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ ATYPE ≠ ALARMTYPEvLAST
│         ∧ (∀ I : ATYPE + 1 .. ALARMTYPEvLAST
│           ⦁ STATE DISPLAY I = S DISPLAY I ∧ TIMERS DISPLAY I = T DISPLAY I)
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│         ∧ (∀ I : ALARMTYPEvFIRST .. ATYPE
│           ⦁ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│               [I/ATYPE,
│               S/STATE⋎0,
│               T/TIMERS⋎0]))
│       ⦁ (∀ I : ATYPE + 1 .. ALARMTYPEvLAST
│           ⦁ STATE DISPLAY I = S DISPLAY I ∧ TIMERS DISPLAY I = T DISPLAY I)
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│         ∧ (∀ I : ALARMTYPEvFIRST .. (ATYPE + 1) - 1
│           ⦁ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│               [I/ATYPE,
│               S/STATE⋎0,
│               T/TIMERS⋎0]))
■

ⓈZ
│ vc120703_4 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE⋎0
│         ∧ T = TIMERS⋎0
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ (∀ I : ALARMTYPEvLAST + 1 .. ALARMTYPEvLAST
│           ⦁ STATE DISPLAY I = S DISPLAY I ∧ TIMERS DISPLAY I = T DISPLAY I)
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│         ∧ (∀ I : ALARMTYPEvFIRST .. ALARMTYPEvLAST
│           ⦁ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│               [I/ATYPE,
│               S/STATE⋎0,
│               T/TIMERS⋎0]))
│       ⦁ ∀ ATYPE : ALARMTYPE
│         ⦁ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│             [S/STATE⋎0,
│             T/TIMERS⋎0])
■

ⓈZ
│ vc120704_1 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | (∀ I : ATYPE .. ALARMTYPEvLAST
│           ⦁ STATE DISPLAY I = S DISPLAY I ∧ TIMERS DISPLAY I = T DISPLAY I)
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│         ∧ (∀ I : ALARMTYPEvFIRST .. ATYPE - 1
│           ⦁ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│               [I/ATYPE,
│               S/STATE⋎0,
│               T/TIMERS⋎0]))
│       ⦁ STATE DISPLAY ATYPE = S DISPLAY ATYPE
│         ∧ TIMERS DISPLAY ATYPE = T DISPLAY ATYPE
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
■

ⓈZ
│ vc120704_2 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | ((∀ I : ATYPE .. ALARMTYPEvLAST
│           ⦁ STATE⋎0 DISPLAY I = S DISPLAY I ∧ TIMERS⋎0 DISPLAY I = T DISPLAY I)
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│         ∧ (∀ I : ALARMTYPEvFIRST .. ATYPE - 1
│           ⦁ (DISPLAY ≜ DISPLAY, I ≜ I, S ≜ S, STATE ≜ STATE⋎0, T ≜ T,
│                 TIMERS ≜ TIMERS⋎0)
│             ∈ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│                 [I/ATYPE,
│                 S/STATE⋎0,
│                 T/TIMERS⋎0])))
│         ∧ (∀ I : ALARMTYPE
│           | I ≠ ATYPE
│           ⦁ STATE DISPLAY I = STATE⋎0 DISPLAY I
│             ∧ TIMERS DISPLAY I = TIMERS⋎0 DISPLAY I)
│         ∧ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│             [S/STATE⋎0,
│             T/TIMERS⋎0])
│       ⦁ (∀ I : ATYPE + 1 .. ALARMTYPEvLAST
│           ⦁ STATE DISPLAY I = S DISPLAY I ∧ TIMERS DISPLAY I = T DISPLAY I)
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│         ∧ (∀ I : ALARMTYPEvFIRST .. ATYPE
│           ⦁ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│               [I/ATYPE,
│               S/STATE⋎0,
│               T/TIMERS⋎0]))
■

ⓈZ
│ vc120705_1 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMEOUT : BASICTYPESoTIME;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | (STATE DISPLAY ATYPE = S DISPLAY ATYPE
│         ∧ TIMERS DISPLAY ATYPE = T DISPLAY ATYPE
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ (STATE DISPLAY ATYPE).LEVEL eq AUDIOVISUALFLASH = TRUE
│         ∧ (STATE DISPLAY ATYPE).LEVEL noteq VISUALINVERSE = TRUE
│       ⦁ (∀ I : ALARMTYPE
│           | I ≠ ATYPE
│           ⦁ (STATE
│                       ⊕ {DISPLAY
│                             ↦ STATE DISPLAY
│                                 ⊕ {ATYPE
│                                       ↦ (LEVEL ≜ VISUALINVERSE,
│                                           RAISED ≜ (STATE DISPLAY ATYPE).RAISED,
│                                           REOCCURS ≜
│                                               (STATE DISPLAY ATYPE).REOCCURS)}})
│                     DISPLAY
│                   I
│               = STATE DISPLAY I
│             ∧ (TIMERS
│                       ⊕ {DISPLAY
│                             ↦ TIMERS DISPLAY
│                                 ⊕ {ATYPE ↦ (ACTIVE ≜ TRUE, TIMEOUT ≜ TIMEOUT)}})
│                     DISPLAY
│                   I
│               = TIMERS DISPLAY I)
│         ∧ (ATYPE ≜ ATYPE, DISPLAY ≜ DISPLAY, S ≜ S,
│               STATE ≜
│                   STATE
│                       ⊕ {DISPLAY
│                             ↦ STATE DISPLAY
│                                 ⊕ {ATYPE
│                                       ↦ (LEVEL ≜ VISUALINVERSE,
│                                           RAISED ≜ (STATE DISPLAY ATYPE).RAISED,
│                                           REOCCURS ≜
│                                               (STATE DISPLAY ATYPE).REOCCURS)}},
│               T ≜ T,
│               TIMERS ≜
│                   TIMERS
│                       ⊕ {DISPLAY
│                             ↦ TIMERS DISPLAY
│                                 ⊕ {ATYPE ↦ (ACTIVE ≜ TRUE, TIMEOUT ≜ TIMEOUT)}})
│           ∈ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│               [S/STATE⋎0,
│               T/TIMERS⋎0])
■

ⓈZ
│ vc120705_2 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMEOUT : BASICTYPESoTIME;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | (STATE DISPLAY ATYPE = S DISPLAY ATYPE
│         ∧ TIMERS DISPLAY ATYPE = T DISPLAY ATYPE
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ (STATE DISPLAY ATYPE).LEVEL eq AUDIOVISUALFLASH = TRUE
│         ∧ (STATE DISPLAY ATYPE).LEVEL noteq VISUALINVERSE = FALSE
│       ⦁ (∀ I : ALARMTYPE
│           | I ≠ ATYPE
│           ⦁ STATE DISPLAY I = STATE DISPLAY I
│             ∧ (TIMERS
│                       ⊕ {DISPLAY
│                             ↦ TIMERS DISPLAY
│                                 ⊕ {ATYPE ↦ (ACTIVE ≜ TRUE, TIMEOUT ≜ TIMEOUT)}})
│                     DISPLAY
│                   I
│               = TIMERS DISPLAY I)
│         ∧ (ATYPE ≜ ATYPE, DISPLAY ≜ DISPLAY, S ≜ S, STATE ≜ STATE, T ≜ T,
│               TIMERS ≜
│                   TIMERS
│                       ⊕ {DISPLAY
│                             ↦ TIMERS DISPLAY
│                                 ⊕ {ATYPE ↦ (ACTIVE ≜ TRUE, TIMEOUT ≜ TIMEOUT)}})
│           ∈ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│               [S/STATE⋎0,
│               T/TIMERS⋎0])
■

ⓈZ
│ vc120705_3 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | (STATE DISPLAY ATYPE = S DISPLAY ATYPE
│         ∧ TIMERS DISPLAY ATYPE = T DISPLAY ATYPE
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ (STATE DISPLAY ATYPE).LEVEL eq AUDIOVISUALFLASH = FALSE
│         ∧ (STATE DISPLAY ATYPE).LEVEL noteq VISUALINVERSE = TRUE
│       ⦁ (∀ I : ALARMTYPE
│           | I ≠ ATYPE
│           ⦁ (STATE
│                       ⊕ {DISPLAY
│                             ↦ STATE DISPLAY
│                                 ⊕ {ATYPE
│                                       ↦ (LEVEL ≜ VISUALINVERSE,
│                                           RAISED ≜ (STATE DISPLAY ATYPE).RAISED,
│                                           REOCCURS ≜
│                                               (STATE DISPLAY ATYPE).REOCCURS)}})
│                     DISPLAY
│                   I
│               = STATE DISPLAY I
│             ∧ TIMERS DISPLAY I = TIMERS DISPLAY I)
│         ∧ (ATYPE ≜ ATYPE, DISPLAY ≜ DISPLAY, S ≜ S,
│               STATE ≜
│                   STATE
│                       ⊕ {DISPLAY
│                             ↦ STATE DISPLAY
│                                 ⊕ {ATYPE
│                                       ↦ (LEVEL ≜ VISUALINVERSE,
│                                           RAISED ≜ (STATE DISPLAY ATYPE).RAISED,
│                                           REOCCURS ≜
│                                               (STATE DISPLAY ATYPE).REOCCURS)}},
│               T ≜ T, TIMERS ≜ TIMERS)
│           ∈ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│               [S/STATE⋎0,
│               T/TIMERS⋎0])
■

ⓈZ
│ vc120705_4 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION;
│         ATYPE : ALARMTYPE
│       | (STATE DISPLAY ATYPE = S DISPLAY ATYPE
│         ∧ TIMERS DISPLAY ATYPE = T DISPLAY ATYPE
│         ∧ (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ (STATE DISPLAY ATYPE).LEVEL eq AUDIOVISUALFLASH = FALSE
│         ∧ (STATE DISPLAY ATYPE).LEVEL noteq VISUALINVERSE = FALSE
│       ⦁ (∀ I : ALARMTYPE
│           | I ≠ ATYPE
│           ⦁ STATE DISPLAY I = STATE DISPLAY I
│             ∧ TIMERS DISPLAY I = TIMERS DISPLAY I)
│         ∧ ((FirstAcceptance ∧ NoAcceptance ∧ InactiveAcceptance)
│             [S/STATE⋎0,
│             T/TIMERS⋎0])
■

ⓈZ
│ vc1208_1 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | S = STATE
│         ∧ T = TIMERS
│         ∧ ¬
│         (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│       ⦁ S = STATE
│         ∧ T = TIMERS
│         ∧ ¬
│         (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
■

ⓈZ
│ vc1208_2 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE⋎0
│         ∧ T = TIMERS⋎0
│         ∧ ¬
│         (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ (∀ ATYPE : ALARMTYPE
│           ⦁ ((SecondAcceptance ∧ InactiveAcceptance) [S/STATE⋎0, T/TIMERS⋎0]))
│       ⦁ ∀ ATYPE : ALARMTYPE ⦁ (AcceptAlarm [S/STATE⋎0, T/TIMERS⋎0])
■

ⓈZ
│ vc120801_1 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS : TIMERSTATE;
│         STATE : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | S = STATE
│         ∧ T = TIMERS
│         ∧ ¬
│         (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY))
│       ⦁ true
■

ⓈZ
│ vc120801_2 ?⊢
│     ∀ S : ALARMSTATE;
│         T : TIMERSTATE;
│         TIMERS, TIMERS⋎0 : TIMERSTATE;
│         STATE, STATE⋎0 : ALARMSTATE;
│         DISPLAY : BASICTYPESoDISPLAYPOSITION
│       | (S = STATE⋎0
│         ∧ T = TIMERS⋎0
│         ∧ ¬
│         (∃ ATYPE1 : ALARMTYPE ⦁ ATYPE1 ∈ NonAcceptedAlarms (S, T, DISPLAY)))
│         ∧ (∀ ATYPE : ALARMTYPE
│           ⦁ ATYPE ∈ InactiveAlarms (STATE, TIMERS, DISPLAY))
│       ⦁ ∀ ATYPE : ALARMTYPE
│         ⦁ ((SecondAcceptance ∧ InactiveAcceptance) [S/STATE⋎0, T/TIMERS⋎0])
■

ⓈZAX
│ ALLDATAINLIMITS : BOOLEAN
├─────────────────
│ true
■
=IGN
open_theory "cn";
duplicate_theory ("Alarm2_body", "ALARM2oTESTPOINTstub");
open_theory "ALARM2oTESTPOINTstub";
delete_all_conjectures();
open_theory "Alarm2_body";

ⓈZ
│ vc1501_1 ?⊢
│     true
│       ⇒ (∀ DISPLAY : BASICTYPESoDISPLAYPOSITION; ATYPE : ALARMTYPE
│         ⦁ ATYPE
│           ∈ InactiveAlarms
│               (ALARMSTATEvRANGE
│                   × {ALARMSTATE1vRANGE
│                       × {(LEVEL ≜ ALARMLEVELvFIRST, RAISED ≜ FALSE,
│                             REOCCURS ≜ ALARMRESETvFIRST)}},
│                 TIMERSTATEvRANGE
│                   × {TIMERSTATE1vRANGE
│                       × {(ACTIVE ≜ FALSE, TIMEOUT ≜ BASICTYPESoTIMEvLAST)}},
│                 DISPLAY))
■

=SML
open_theory "cn";
duplicate_theory ("Alarm_body", "ALARMoTESTPOINTstub");
open_theory "ALARMoTESTPOINTstub";
delete_all_conjectures();
open_theory "Alarm_body";

(* Number of VCs in theory "SENSORspec" : 0 *)

(* Number of VCs in theory "SHOLSELECTIONspec" : 0 *)

(* Number of VCs in theory "ALARMoTESTPOINTstub" : 0 *)

(* Number of VCs in theory "Alarm_body" : 62 *)

(* Number of VCs in theory "ALARM2oTESTPOINTstub" : 0 *)

(* Number of VCs in theory "Alarm2_body" : 62 *)

=TEX

\end{document}
