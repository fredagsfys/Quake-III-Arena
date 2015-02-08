data
export drawTeamOverlayModificationCount
align 4
LABELV drawTeamOverlayModificationCount
byte 4 -1
export CG_InitTeamChat
code
proc CG_InitTeamChat 0 12
file "../cg_newdraw.c"
line 43
;1:/*
;2:===========================================================================
;3:Copyright (C) 1999-2005 Id Software, Inc.
;4:
;5:This file is part of Quake III Arena source code.
;6:
;7:Quake III Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Quake III Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Foobar; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:===========================================================================
;21:*/
;22:
;23:#ifndef MISSIONPACK // bk001204
;24:#error This file not be used for classic Q3A.
;25:#endif
;26:
;27:#include "cg_local.h"
;28:#include "../ui/ui_shared.h"
;29:
;30:extern displayContextDef_t cgDC;
;31:
;32:
;33:// set in CG_ParseTeamInfo
;34:
;35://static int sortedTeamPlayers[TEAM_MAXOVERLAY];
;36://static int numSortedTeamPlayers;
;37:int drawTeamOverlayModificationCount = -1;
;38:
;39://static char systemChat[256];
;40://static char teamChat1[256];
;41://static char teamChat2[256];
;42:
;43:void CG_InitTeamChat() {
line 44
;44:  memset(teamChat1, 0, sizeof(teamChat1));
ADDRGP4 teamChat1
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 45
;45:  memset(teamChat2, 0, sizeof(teamChat2));
ADDRGP4 teamChat2
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 46
;46:  memset(systemChat, 0, sizeof(systemChat));
ADDRGP4 systemChat
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 47
;47:}
LABELV $79
endproc CG_InitTeamChat 0 12
export CG_SetPrintString
proc CG_SetPrintString 0 8
line 49
;48:
;49:void CG_SetPrintString(int type, const char *p) {
line 50
;50:  if (type == SYSTEM_PRINT) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $81
line 51
;51:    strcpy(systemChat, p);
ADDRGP4 systemChat
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 52
;52:  } else {
ADDRGP4 $82
JUMPV
LABELV $81
line 53
;53:    strcpy(teamChat2, teamChat1);
ADDRGP4 teamChat2
ARGP4
ADDRGP4 teamChat1
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 54
;54:    strcpy(teamChat1, p);
ADDRGP4 teamChat1
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 55
;55:  }
LABELV $82
line 56
;56:}
LABELV $80
endproc CG_SetPrintString 0 8
export CG_CheckOrderPending
proc CG_CheckOrderPending 28 12
line 58
;57:
;58:void CG_CheckOrderPending() {
line 59
;59:	if (cgs.gametype < GT_CTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
GEI4 $84
line 60
;60:		return;
ADDRGP4 $83
JUMPV
LABELV $84
line 62
;61:	}
;62:	if (cgs.orderPending) {
ADDRGP4 cgs+152284
INDIRI4
CNSTI4 0
EQI4 $87
line 65
;63:		//clientInfo_t *ci = cgs.clientinfo + sortedTeamPlayers[cg_currentSelectedPlayer.integer];
;64:		const char *p1, *p2, *b;
;65:		p1 = p2 = b = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 66
;66:		switch (cgs.currentOrder) {
ADDRLP4 16
ADDRGP4 cgs+152280
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $90
ADDRLP4 16
INDIRI4
CNSTI4 7
GTI4 $90
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $118-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $118
address $93
address $97
address $101
address $105
address $112
address $115
address $109
code
LABELV $93
line 68
;67:			case TEAMTASK_OFFENSE:
;68:				p1 = VOICECHAT_ONOFFENSE;
ADDRLP4 8
ADDRGP4 $94
ASGNP4
line 69
;69:				p2 = VOICECHAT_OFFENSE;
ADDRLP4 4
ADDRGP4 $95
ASGNP4
line 70
;70:				b = "+button7; wait; -button7";
ADDRLP4 0
ADDRGP4 $96
ASGNP4
line 71
;71:			break;
ADDRGP4 $91
JUMPV
LABELV $97
line 73
;72:			case TEAMTASK_DEFENSE:
;73:				p1 = VOICECHAT_ONDEFENSE;
ADDRLP4 8
ADDRGP4 $98
ASGNP4
line 74
;74:				p2 = VOICECHAT_DEFEND;
ADDRLP4 4
ADDRGP4 $99
ASGNP4
line 75
;75:				b = "+button8; wait; -button8";
ADDRLP4 0
ADDRGP4 $100
ASGNP4
line 76
;76:			break;					
ADDRGP4 $91
JUMPV
LABELV $101
line 78
;77:			case TEAMTASK_PATROL:
;78:				p1 = VOICECHAT_ONPATROL;
ADDRLP4 8
ADDRGP4 $102
ASGNP4
line 79
;79:				p2 = VOICECHAT_PATROL;
ADDRLP4 4
ADDRGP4 $103
ASGNP4
line 80
;80:				b = "+button9; wait; -button9";
ADDRLP4 0
ADDRGP4 $104
ASGNP4
line 81
;81:			break;
ADDRGP4 $91
JUMPV
LABELV $105
line 83
;82:			case TEAMTASK_FOLLOW: 
;83:				p1 = VOICECHAT_ONFOLLOW;
ADDRLP4 8
ADDRGP4 $106
ASGNP4
line 84
;84:				p2 = VOICECHAT_FOLLOWME;
ADDRLP4 4
ADDRGP4 $107
ASGNP4
line 85
;85:				b = "+button10; wait; -button10";
ADDRLP4 0
ADDRGP4 $108
ASGNP4
line 86
;86:			break;
ADDRGP4 $91
JUMPV
LABELV $109
line 88
;87:			case TEAMTASK_CAMP:
;88:				p1 = VOICECHAT_ONCAMPING;
ADDRLP4 8
ADDRGP4 $110
ASGNP4
line 89
;89:				p2 = VOICECHAT_CAMP;
ADDRLP4 4
ADDRGP4 $111
ASGNP4
line 90
;90:			break;
ADDRGP4 $91
JUMPV
LABELV $112
line 92
;91:			case TEAMTASK_RETRIEVE:
;92:				p1 = VOICECHAT_ONGETFLAG;
ADDRLP4 8
ADDRGP4 $113
ASGNP4
line 93
;93:				p2 = VOICECHAT_RETURNFLAG;
ADDRLP4 4
ADDRGP4 $114
ASGNP4
line 94
;94:			break;
ADDRGP4 $91
JUMPV
LABELV $115
line 96
;95:			case TEAMTASK_ESCORT:
;96:				p1 = VOICECHAT_ONFOLLOWCARRIER;
ADDRLP4 8
ADDRGP4 $116
ASGNP4
line 97
;97:				p2 = VOICECHAT_FOLLOWFLAGCARRIER;
ADDRLP4 4
ADDRGP4 $117
ASGNP4
line 98
;98:			break;
LABELV $90
LABELV $91
line 101
;99:		}
;100:
;101:		if (cg_currentSelectedPlayer.integer == numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
NEI4 $120
line 103
;102:			// to everyone
;103:			trap_SendConsoleCommand(va("cmd vsay_team %s\n", p2));
ADDRGP4 $123
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 104
;104:		} else {
ADDRGP4 $121
JUMPV
LABELV $120
line 106
;105:			// for the player self
;106:			if (sortedTeamPlayers[cg_currentSelectedPlayer.integer] == cg.snap->ps.clientNum && p1) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $124
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $124
line 107
;107:				trap_SendConsoleCommand(va("teamtask %i\n", cgs.currentOrder));
ADDRGP4 $128
ARGP4
ADDRGP4 cgs+152280
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 109
;108:				//trap_SendConsoleCommand(va("cmd say_team %s\n", p2));
;109:				trap_SendConsoleCommand(va("cmd vsay_team %s\n", p1));
ADDRGP4 $123
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 110
;110:			} else if (p2) {
ADDRGP4 $125
JUMPV
LABELV $124
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $130
line 112
;111:				//trap_SendConsoleCommand(va("cmd say_team %s, %s\n", ci->name,p));
;112:				trap_SendConsoleCommand(va("cmd vtell %d %s\n", sortedTeamPlayers[cg_currentSelectedPlayer.integer], p2));
ADDRGP4 $132
ARGP4
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 113
;113:			}
LABELV $130
LABELV $125
line 114
;114:		}
LABELV $121
line 115
;115:		if (b) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $134
line 116
;116:			trap_SendConsoleCommand(b);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 117
;117:		}
LABELV $134
line 118
;118:		cgs.orderPending = qfalse;
ADDRGP4 cgs+152284
CNSTI4 0
ASGNI4
line 119
;119:	}
LABELV $87
line 120
;120:}
LABELV $83
endproc CG_CheckOrderPending 28 12
proc CG_SetSelectedPlayerName 8 8
line 122
;121:
;122:static void CG_SetSelectedPlayerName() {
line 123
;123:  if (cg_currentSelectedPlayer.integer >= 0 && cg_currentSelectedPlayer.integer < numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 0
LTI4 $138
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
GEI4 $138
line 124
;124:		clientInfo_t *ci = cgs.clientinfo + sortedTeamPlayers[cg_currentSelectedPlayer.integer];
ADDRLP4 0
CNSTI4 1708
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 125
;125:	  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $139
line 126
;126:			trap_Cvar_Set("cg_selectedPlayerName", ci->name);
ADDRGP4 $146
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 127
;127:			trap_Cvar_Set("cg_selectedPlayer", va("%d", sortedTeamPlayers[cg_currentSelectedPlayer.integer]));
ADDRGP4 $148
ARGP4
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $147
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 128
;128:			cgs.currentOrder = ci->teamTask;
ADDRGP4 cgs+152280
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 129
;129:	  }
line 130
;130:	} else {
ADDRGP4 $139
JUMPV
LABELV $138
line 131
;131:		trap_Cvar_Set("cg_selectedPlayerName", "Everyone");
ADDRGP4 $146
ARGP4
ADDRGP4 $151
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 132
;132:	}
LABELV $139
line 133
;133:}
LABELV $137
endproc CG_SetSelectedPlayerName 8 8
export CG_GetSelectedPlayer
proc CG_GetSelectedPlayer 0 0
line 134
;134:int CG_GetSelectedPlayer() {
line 135
;135:	if (cg_currentSelectedPlayer.integer < 0 || cg_currentSelectedPlayer.integer >= numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 0
LTI4 $157
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
LTI4 $153
LABELV $157
line 136
;136:		cg_currentSelectedPlayer.integer = 0;
ADDRGP4 cg_currentSelectedPlayer+12
CNSTI4 0
ASGNI4
line 137
;137:	}
LABELV $153
line 138
;138:	return cg_currentSelectedPlayer.integer;
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
RETI4
LABELV $152
endproc CG_GetSelectedPlayer 0 0
export CG_SelectNextPlayer
proc CG_SelectNextPlayer 4 0
line 141
;139:}
;140:
;141:void CG_SelectNextPlayer() {
line 142
;142:	CG_CheckOrderPending();
ADDRGP4 CG_CheckOrderPending
CALLV
pop
line 143
;143:	if (cg_currentSelectedPlayer.integer >= 0 && cg_currentSelectedPlayer.integer < numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 0
LTI4 $161
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
GEI4 $161
line 144
;144:		cg_currentSelectedPlayer.integer++;
ADDRLP4 0
ADDRGP4 cg_currentSelectedPlayer+12
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 145
;145:	} else {
ADDRGP4 $162
JUMPV
LABELV $161
line 146
;146:		cg_currentSelectedPlayer.integer = 0;
ADDRGP4 cg_currentSelectedPlayer+12
CNSTI4 0
ASGNI4
line 147
;147:	}
LABELV $162
line 148
;148:	CG_SetSelectedPlayerName();
ADDRGP4 CG_SetSelectedPlayerName
CALLV
pop
line 149
;149:}
LABELV $160
endproc CG_SelectNextPlayer 4 0
export CG_SelectPrevPlayer
proc CG_SelectPrevPlayer 4 0
line 151
;150:
;151:void CG_SelectPrevPlayer() {
line 152
;152:	CG_CheckOrderPending();
ADDRGP4 CG_CheckOrderPending
CALLV
pop
line 153
;153:	if (cg_currentSelectedPlayer.integer > 0 && cg_currentSelectedPlayer.integer < numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
CNSTI4 0
LEI4 $168
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
GEI4 $168
line 154
;154:		cg_currentSelectedPlayer.integer--;
ADDRLP4 0
ADDRGP4 cg_currentSelectedPlayer+12
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 155
;155:	} else {
ADDRGP4 $169
JUMPV
LABELV $168
line 156
;156:		cg_currentSelectedPlayer.integer = numSortedTeamPlayers;
ADDRGP4 cg_currentSelectedPlayer+12
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
line 157
;157:	}
LABELV $169
line 158
;158:	CG_SetSelectedPlayerName();
ADDRGP4 CG_SetSelectedPlayerName
CALLV
pop
line 159
;159:}
LABELV $167
endproc CG_SelectPrevPlayer 4 0
proc CG_DrawPlayerArmorIcon 44 32
line 162
;160:
;161:
;162:static void CG_DrawPlayerArmorIcon( rectDef_t *rect, qboolean draw2D ) {
line 168
;163:	centity_t	*cent;
;164:	playerState_t	*ps;
;165:	vec3_t		angles;
;166:	vec3_t		origin;
;167:
;168:  if ( cg_drawStatus.integer == 0 ) {
ADDRGP4 cg_drawStatus+12
INDIRI4
CNSTI4 0
NEI4 $175
line 169
;169:		return;
ADDRGP4 $174
JUMPV
LABELV $175
line 172
;170:	}
;171:
;172:	cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 12
CNSTI4 728
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 173
;173:	ps = &cg.snap->ps;
ADDRLP4 16
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 175
;174:
;175:	if ( draw2D || ( !cg_draw3dIcons.integer && cg_drawIcons.integer) ) { // bk001206 - parentheses
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $184
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $180
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $180
LABELV $184
line 176
;176:		CG_DrawPic( rect->x, rect->y + rect->h/2 + 1, rect->w, rect->h, cgs.media.armorIcon );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRGP4 cgs+152340+156
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 177
;177:  } else if (cg_draw3dIcons.integer) {
ADDRGP4 $181
JUMPV
LABELV $180
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $187
line 178
;178:	  VectorClear( angles );
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 36
INDIRF4
ASGNF4
line 179
;179:    origin[0] = 90;
ADDRLP4 20
CNSTF4 1119092736
ASGNF4
line 180
;180:  	origin[1] = 0;
ADDRLP4 20+4
CNSTF4 0
ASGNF4
line 181
;181:  	origin[2] = -10;
ADDRLP4 20+8
CNSTF4 3240099840
ASGNF4
line 182
;182:  	angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRLP4 0+4
CNSTI4 360
ADDRGP4 cg+107604
INDIRI4
CNSTI4 2047
BANDI4
MULI4
CVIF4 4
CNSTF4 1157627904
DIVF4
ASGNF4
line 184
;183:  
;184:    CG_Draw3DModel( rect->x, rect->y, rect->w, rect->h, cgs.media.armorModel, 0, origin, angles );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+152340+152
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 20
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 185
;185:  }
LABELV $187
LABELV $181
line 187
;186:
;187:}
LABELV $174
endproc CG_DrawPlayerArmorIcon 44 32
proc CG_DrawPlayerArmorValue 36 32
line 189
;188:
;189:static void CG_DrawPlayerArmorValue(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 195
;190:	char	num[16];
;191:  int value;
;192:	centity_t	*cent;
;193:	playerState_t	*ps;
;194:
;195:  cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 24
CNSTI4 728
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 196
;196:	ps = &cg.snap->ps;
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 198
;197:
;198:	value = ps->stats[STAT_ARMOR];
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 201
;199:  
;200:
;201:	if (shader) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $201
line 202
;202:    trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 203
;203:		CG_DrawPic(rect->x, rect->y, rect->w, rect->h, shader);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 204
;204:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 205
;205:	} else {
ADDRGP4 $202
JUMPV
LABELV $201
line 206
;206:		Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $203
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 207
;207:		value = CG_Text_Width(num, scale, 0);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 208
;208:	  CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 209
;209:	}
LABELV $202
line 210
;210:}
LABELV $198
endproc CG_DrawPlayerArmorValue 36 32
proc CG_DrawPlayerAmmoIcon 56 32
line 222
;211:
;212:#ifndef MISSIONPACK // bk001206 
;213:static float healthColors[4][4] = { 
;214://		{ 0.2, 1.0, 0.2, 1.0 } , { 1.0, 0.2, 0.2, 1.0 }, {0.5, 0.5, 0.5, 1} };
;215:  // bk0101016 - float const
;216:  { 1.0f, 0.69f, 0.0f, 1.0f } ,		// normal
;217:  { 1.0f, 0.2f, 0.2f, 1.0f },		// low health
;218:  { 0.5f, 0.5f, 0.5f, 1.0f},		// weapon firing
;219:  { 1.0f, 1.0f, 1.0f, 1.0f } };		// health > 100
;220:#endif
;221:
;222:static void CG_DrawPlayerAmmoIcon( rectDef_t *rect, qboolean draw2D ) {
line 228
;223:	centity_t	*cent;
;224:	playerState_t	*ps;
;225:	vec3_t		angles;
;226:	vec3_t		origin;
;227:
;228:	cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 0
CNSTI4 728
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 229
;229:	ps = &cg.snap->ps;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 231
;230:
;231:	if ( draw2D || (!cg_draw3dIcons.integer && cg_drawIcons.integer) ) { // bk001206 - parentheses
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $211
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $207
ADDRGP4 cg_drawIcons+12
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $207
LABELV $211
line 233
;232:	  qhandle_t	icon;
;233:    icon = cg_weapons[ cg.predictedPlayerState.weapon ].ammoIcon;
ADDRLP4 36
CNSTI4 136
ADDRGP4 cg+107636+144
INDIRI4
MULI4
ADDRGP4 cg_weapons+72
ADDP4
INDIRI4
ASGNI4
line 234
;234:		if ( icon ) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $208
line 235
;235:		  CG_DrawPic( rect->x, rect->y, rect->w, rect->h, icon );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 236
;236:		}
line 237
;237:  } else if (cg_draw3dIcons.integer) {
ADDRGP4 $208
JUMPV
LABELV $207
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $217
line 238
;238:  	if ( cent->currentState.weapon && cg_weapons[ cent->currentState.weapon ].ammoModel ) {
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $220
CNSTI4 136
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 cg_weapons+76
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $220
line 239
;239:	    VectorClear( angles );
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 8+8
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 44
INDIRF4
ASGNF4
line 240
;240:	  	origin[0] = 70;
ADDRLP4 20
CNSTF4 1116471296
ASGNF4
line 241
;241:  		origin[1] = 0;
ADDRLP4 20+4
CNSTF4 0
ASGNF4
line 242
;242:  		origin[2] = 0;
ADDRLP4 20+8
CNSTF4 0
ASGNF4
line 243
;243:  		angles[YAW] = 90 + 20 * sin( cg.time / 1000.0 );
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 48
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8+4
CNSTF4 1101004800
ADDRLP4 48
INDIRF4
MULF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 244
;244:  		CG_Draw3DModel( rect->x, rect->y, rect->w, rect->h, cg_weapons[ cent->currentState.weapon ].ammoModel, 0, origin, angles );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 136
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+76
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 20
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 245
;245:  	}
LABELV $220
line 246
;246:  }
LABELV $217
LABELV $208
line 247
;247:}
LABELV $204
endproc CG_DrawPlayerAmmoIcon 56 32
proc CG_DrawPlayerAmmoValue 36 32
line 249
;248:
;249:static void CG_DrawPlayerAmmoValue(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 255
;250:	char	num[16];
;251:	int value;
;252:	centity_t	*cent;
;253:	playerState_t	*ps;
;254:
;255:	cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 0
CNSTI4 728
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 256
;256:	ps = &cg.snap->ps;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 258
;257:
;258:	if ( cent->currentState.weapon ) {
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $233
line 259
;259:		value = ps->ammo[cent->currentState.weapon];
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ASGNI4
line 260
;260:		if ( value > -1 ) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
LEI4 $235
line 261
;261:			if (shader) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $237
line 262
;262:		    trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 263
;263:				CG_DrawPic(rect->x, rect->y, rect->w, rect->h, shader);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 264
;264:			  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 265
;265:			} else {
ADDRGP4 $238
JUMPV
LABELV $237
line 266
;266:				Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 12
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $203
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 267
;267:				value = CG_Text_Width(num, scale, 0);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 268
;268:				CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 269
;269:			}
LABELV $238
line 270
;270:		}
LABELV $235
line 271
;271:	}
LABELV $233
line 273
;272:
;273:}
LABELV $230
endproc CG_DrawPlayerAmmoValue 36 32
proc CG_DrawPlayerHead 60 24
line 277
;274:
;275:
;276:
;277:static void CG_DrawPlayerHead(rectDef_t *rect, qboolean draw2D) {
line 281
;278:	vec3_t		angles;
;279:	float		size, stretch;
;280:	float		frac;
;281:	float		x = rect->x;
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 283
;282:
;283:	VectorClear( angles );
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 4+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
line 285
;284:
;285:	if ( cg.damageTime && cg.time - cg.damageTime < DAMAGE_TIME ) {
ADDRGP4 cg+124688
INDIRF4
CNSTF4 0
EQF4 $242
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
ADDRGP4 cg+124688
INDIRF4
SUBF4
CNSTF4 1140457472
GEF4 $242
line 286
;286:		frac = (float)(cg.time - cg.damageTime ) / DAMAGE_TIME;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
ADDRGP4 cg+124688
INDIRF4
SUBF4
CNSTF4 1140457472
DIVF4
ASGNF4
line 287
;287:		size = rect->w * 1.25 * ( 1.5 - frac * 0.5 );
ADDRLP4 20
CNSTF4 1067450368
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
CNSTF4 1069547520
CNSTF4 1056964608
ADDRLP4 0
INDIRF4
MULF4
SUBF4
MULF4
ASGNF4
line 289
;288:
;289:		stretch = size - rect->w * 1.25;
ADDRLP4 24
ADDRLP4 20
INDIRF4
CNSTF4 1067450368
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
SUBF4
ASGNF4
line 291
;290:		// kick in the direction of damage
;291:		x -= stretch * 0.5 + cg.damageX * stretch * 0.5;
ADDRLP4 32
CNSTF4 1056964608
ASGNF4
ADDRLP4 36
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+124692
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
MULF4
ADDF4
SUBF4
ASGNF4
line 293
;292:
;293:		cg.headStartYaw = 180 + cg.damageX * 45;
ADDRGP4 cg+124724
CNSTF4 1110704128
ADDRGP4 cg+124692
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 295
;294:
;295:		cg.headEndYaw = 180 + 20 * cos( crandom()*M_PI );
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ARGF4
ADDRLP4 44
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+124712
CNSTF4 1101004800
ADDRLP4 44
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 296
;296:		cg.headEndPitch = 5 * cos( crandom()*M_PI );
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ARGF4
ADDRLP4 52
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+124708
CNSTF4 1084227584
ADDRLP4 52
INDIRF4
MULF4
ASGNF4
line 298
;297:
;298:		cg.headStartTime = cg.time;
ADDRGP4 cg+124728
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 299
;299:		cg.headEndTime = cg.time + 100 + random() * 2000;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+124716
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
CNSTF4 1157234688
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 300
;300:	} else {
ADDRGP4 $243
JUMPV
LABELV $242
line 301
;301:		if ( cg.time >= cg.headEndTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+124716
INDIRI4
LTI4 $258
line 303
;302:			// select a new head angle
;303:			cg.headStartYaw = cg.headEndYaw;
ADDRGP4 cg+124724
ADDRGP4 cg+124712
INDIRF4
ASGNF4
line 304
;304:			cg.headStartPitch = cg.headEndPitch;
ADDRGP4 cg+124720
ADDRGP4 cg+124708
INDIRF4
ASGNF4
line 305
;305:			cg.headStartTime = cg.headEndTime;
ADDRGP4 cg+124728
ADDRGP4 cg+124716
INDIRI4
ASGNI4
line 306
;306:			cg.headEndTime = cg.time + 100 + random() * 2000;
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+124716
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
CNSTF4 1157234688
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 308
;307:
;308:			cg.headEndYaw = 180 + 20 * cos( crandom()*M_PI );
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ARGF4
ADDRLP4 40
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+124712
CNSTF4 1101004800
ADDRLP4 40
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 309
;309:			cg.headEndPitch = 5 * cos( crandom()*M_PI );
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
CNSTF4 1078530011
CNSTF4 1073741824
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ARGF4
ADDRLP4 48
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+124708
CNSTF4 1084227584
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 310
;310:		}
LABELV $258
line 312
;311:
;312:		size = rect->w * 1.25;
ADDRLP4 20
CNSTF4 1067450368
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 313
;313:	}
LABELV $243
line 316
;314:
;315:	// if the server was frozen for a while we may have a bad head start time
;316:	if ( cg.headStartTime > cg.time ) {
ADDRGP4 cg+124728
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $272
line 317
;317:		cg.headStartTime = cg.time;
ADDRGP4 cg+124728
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 318
;318:	}
LABELV $272
line 320
;319:
;320:	frac = ( cg.time - cg.headStartTime ) / (float)( cg.headEndTime - cg.headStartTime );
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+124728
INDIRI4
SUBI4
CVIF4 4
ADDRGP4 cg+124716
INDIRI4
ADDRGP4 cg+124728
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 321
;321:	frac = frac * frac * ( 3 - 2 * frac );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1077936128
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
SUBF4
MULF4
ASGNF4
line 322
;322:	angles[YAW] = cg.headStartYaw + ( cg.headEndYaw - cg.headStartYaw ) * frac;
ADDRLP4 4+4
ADDRGP4 cg+124724
INDIRF4
ADDRGP4 cg+124712
INDIRF4
ADDRGP4 cg+124724
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 323
;323:	angles[PITCH] = cg.headStartPitch + ( cg.headEndPitch - cg.headStartPitch ) * frac;
ADDRLP4 4
ADDRGP4 cg+124720
INDIRF4
ADDRGP4 cg+124708
INDIRF4
ADDRGP4 cg+124720
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 325
;324:
;325:	CG_DrawHead( x, rect->y, rect->w, rect->h, cg.snap->ps.clientNum, angles );
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 326
;326:}
LABELV $239
endproc CG_DrawPlayerHead 60 24
proc CG_DrawSelectedPlayerHealth 36 32
line 328
;327:
;328:static void CG_DrawSelectedPlayerHealth( rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 333
;329:	clientInfo_t *ci;
;330:	int value;
;331:	char num[16];
;332:
;333:  ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 24
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 0
CNSTI4 1708
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 334
;334:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $292
line 335
;335:		if (shader) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $294
line 336
;336:			trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 337
;337:			CG_DrawPic(rect->x, rect->y, rect->w, rect->h, shader);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 338
;338:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 339
;339:		} else {
ADDRGP4 $295
JUMPV
LABELV $294
line 340
;340:			Com_sprintf (num, sizeof(num), "%i", ci->health);
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $203
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 341
;341:		  value = CG_Text_Width(num, scale, 0);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 342
;342:		  CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 343
;343:		}
LABELV $295
line 344
;344:	}
LABELV $292
line 345
;345:}
LABELV $290
endproc CG_DrawSelectedPlayerHealth 36 32
proc CG_DrawSelectedPlayerArmor 36 32
line 347
;346:
;347:static void CG_DrawSelectedPlayerArmor( rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 351
;348:	clientInfo_t *ci;
;349:	int value;
;350:	char num[16];
;351:  ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 24
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 0
CNSTI4 1708
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 352
;352:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $298
line 353
;353:    if (ci->armor > 0) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 0
LEI4 $300
line 354
;354:			if (shader) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $302
line 355
;355:				trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 356
;356:				CG_DrawPic(rect->x, rect->y, rect->w, rect->h, shader);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 357
;357:				trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 358
;358:			} else {
ADDRGP4 $303
JUMPV
LABELV $302
line 359
;359:				Com_sprintf (num, sizeof(num), "%i", ci->armor);
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $203
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 360
;360:				value = CG_Text_Width(num, scale, 0);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 361
;361:				CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 362
;362:			}
LABELV $303
line 363
;363:		}
LABELV $300
line 364
;364: 	}
LABELV $298
line 365
;365:}
LABELV $296
endproc CG_DrawSelectedPlayerArmor 36 32
export CG_StatusHandle
proc CG_StatusHandle 8 0
line 367
;366:
;367:qhandle_t CG_StatusHandle(int task) {
line 368
;368:	qhandle_t h = cgs.media.assaultShader;
ADDRLP4 0
ADDRGP4 cgs+152340+1160
INDIRI4
ASGNI4
line 369
;369:	switch (task) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $307
ADDRLP4 4
INDIRI4
CNSTI4 7
GTI4 $307
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $332-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $332
address $309
address $312
address $315
address $318
address $324
address $327
address $321
code
LABELV $309
line 371
;370:		case TEAMTASK_OFFENSE :
;371:			h = cgs.media.assaultShader;
ADDRLP4 0
ADDRGP4 cgs+152340+1160
INDIRI4
ASGNI4
line 372
;372:			break;
ADDRGP4 $308
JUMPV
LABELV $312
line 374
;373:		case TEAMTASK_DEFENSE :
;374:			h = cgs.media.defendShader;
ADDRLP4 0
ADDRGP4 cgs+152340+1172
INDIRI4
ASGNI4
line 375
;375:			break;
ADDRGP4 $308
JUMPV
LABELV $315
line 377
;376:		case TEAMTASK_PATROL :
;377:			h = cgs.media.patrolShader;
ADDRLP4 0
ADDRGP4 cgs+152340+1156
INDIRI4
ASGNI4
line 378
;378:			break;
ADDRGP4 $308
JUMPV
LABELV $318
line 380
;379:		case TEAMTASK_FOLLOW :
;380:			h = cgs.media.followShader;
ADDRLP4 0
ADDRGP4 cgs+152340+1168
INDIRI4
ASGNI4
line 381
;381:			break;
ADDRGP4 $308
JUMPV
LABELV $321
line 383
;382:		case TEAMTASK_CAMP :
;383:			h = cgs.media.campShader;
ADDRLP4 0
ADDRGP4 cgs+152340+1164
INDIRI4
ASGNI4
line 384
;384:			break;
ADDRGP4 $308
JUMPV
LABELV $324
line 386
;385:		case TEAMTASK_RETRIEVE :
;386:			h = cgs.media.retrieveShader; 
ADDRLP4 0
ADDRGP4 cgs+152340+1180
INDIRI4
ASGNI4
line 387
;387:			break;
ADDRGP4 $308
JUMPV
LABELV $327
line 389
;388:		case TEAMTASK_ESCORT :
;389:			h = cgs.media.escortShader; 
ADDRLP4 0
ADDRGP4 cgs+152340+1184
INDIRI4
ASGNI4
line 390
;390:			break;
ADDRGP4 $308
JUMPV
LABELV $307
line 392
;391:		default : 
;392:			h = cgs.media.assaultShader;
ADDRLP4 0
ADDRGP4 cgs+152340+1160
INDIRI4
ASGNI4
line 393
;393:			break;
LABELV $308
line 395
;394:	}
;395:	return h;
ADDRLP4 0
INDIRI4
RETI4
LABELV $304
endproc CG_StatusHandle 8 0
proc CG_DrawSelectedPlayerStatus 16 20
line 398
;396:}
;397:
;398:static void CG_DrawSelectedPlayerStatus( rectDef_t *rect ) {
line 399
;399:	clientInfo_t *ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 4
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 0
CNSTI4 1708
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 400
;400:	if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $336
line 402
;401:		qhandle_t h;
;402:		if (cgs.orderPending) {
ADDRGP4 cgs+152284
INDIRI4
CNSTI4 0
EQI4 $338
line 404
;403:			// blink the icon
;404:			if ( cg.time > cgs.orderTime - 2500 && (cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+152288
INDIRI4
CNSTI4 2500
SUBI4
LEI4 $341
ADDRGP4 cg+107604
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $341
line 405
;405:				return;
ADDRGP4 $334
JUMPV
LABELV $341
line 407
;406:			}
;407:			h = CG_StatusHandle(cgs.currentOrder);
ADDRGP4 cgs+152280
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 408
;408:		}	else {
ADDRGP4 $339
JUMPV
LABELV $338
line 409
;409:			h = CG_StatusHandle(ci->teamTask);
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 410
;410:		}
LABELV $339
line 411
;411:		CG_DrawPic( rect->x, rect->y, rect->w, rect->h, h );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 412
;412:	}
LABELV $336
line 413
;413:}
LABELV $334
endproc CG_DrawSelectedPlayerStatus 16 20
proc CG_DrawPlayerStatus 16 20
line 416
;414:
;415:
;416:static void CG_DrawPlayerStatus( rectDef_t *rect ) {
line 417
;417:	clientInfo_t *ci = &cgs.clientinfo[cg.snap->ps.clientNum];
ADDRLP4 0
CNSTI4 1708
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 418
;418:	if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $350
line 419
;419:		qhandle_t h = CG_StatusHandle(ci->teamTask);
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 420
;420:		CG_DrawPic( rect->x, rect->y, rect->w, rect->h, h);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 421
;421:	}
LABELV $350
line 422
;422:}
LABELV $347
endproc CG_DrawPlayerStatus 16 20
proc CG_DrawSelectedPlayerName 20 32
line 425
;423:
;424:
;425:static void CG_DrawSelectedPlayerName( rectDef_t *rect, float scale, vec4_t color, qboolean voice, int textStyle) {
line 427
;426:	clientInfo_t *ci;
;427:  ci = cgs.clientinfo + ((voice) ? cgs.currentVoiceClient : sortedTeamPlayers[CG_GetSelectedPlayer()]);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $356
ADDRLP4 4
ADDRGP4 cgs+152292
INDIRI4
ASGNI4
ADDRGP4 $357
JUMPV
LABELV $356
ADDRLP4 8
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ASGNI4
LABELV $357
ADDRLP4 0
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 428
;428:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $358
line 429
;429:    CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, ci->name, 0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 430
;430:  }
LABELV $358
line 431
;431:}
LABELV $352
endproc CG_DrawSelectedPlayerName 20 32
proc CG_DrawSelectedPlayerLocation 24 32
line 433
;432:
;433:static void CG_DrawSelectedPlayerLocation( rectDef_t *rect, float scale, vec4_t color, int textStyle ) {
line 435
;434:	clientInfo_t *ci;
;435:  ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 4
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 0
CNSTI4 1708
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 436
;436:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $362
line 437
;437:		const char *p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRLP4 12
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 438
;438:		if (!p || !*p) {
ADDRLP4 16
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $366
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $364
LABELV $366
line 439
;439:			p = "unknown";
ADDRLP4 8
ADDRGP4 $367
ASGNP4
line 440
;440:		}
LABELV $364
line 441
;441:    CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, p, 0, 0, textStyle);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 442
;442:  }
LABELV $362
line 443
;443:}
LABELV $360
endproc CG_DrawSelectedPlayerLocation 24 32
proc CG_DrawPlayerLocation 20 32
line 445
;444:
;445:static void CG_DrawPlayerLocation( rectDef_t *rect, float scale, vec4_t color, int textStyle  ) {
line 446
;446:	clientInfo_t *ci = &cgs.clientinfo[cg.snap->ps.clientNum];
ADDRLP4 0
CNSTI4 1708
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 447
;447:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $371
line 448
;448:		const char *p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 449
;449:		if (!p || !*p) {
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $375
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $373
LABELV $375
line 450
;450:			p = "unknown";
ADDRLP4 4
ADDRGP4 $367
ASGNP4
line 451
;451:		}
LABELV $373
line 452
;452:    CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, p, 0, 0, textStyle);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 453
;453:  }
LABELV $371
line 454
;454:}
LABELV $368
endproc CG_DrawPlayerLocation 20 32
proc CG_DrawSelectedPlayerWeapon 12 20
line 458
;455:
;456:
;457:
;458:static void CG_DrawSelectedPlayerWeapon( rectDef_t *rect ) {
line 461
;459:	clientInfo_t *ci;
;460:
;461:  ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 4
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 0
CNSTI4 1708
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 462
;462:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $378
line 463
;463:	  if ( cg_weapons[ci->curWeapon].weaponIcon ) {
CNSTI4 136
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $380
line 464
;464:	    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cg_weapons[ci->curWeapon].weaponIcon );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 136
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 465
;465:		} else {
ADDRGP4 $381
JUMPV
LABELV $380
line 466
;466:  	  CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.deferShader);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+152340+164
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 467
;467:    }
LABELV $381
line 468
;468:  }
LABELV $378
line 469
;469:}
LABELV $376
endproc CG_DrawSelectedPlayerWeapon 12 20
proc CG_DrawPlayerScore 28 32
line 471
;470:
;471:static void CG_DrawPlayerScore( rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 473
;472:  char num[16];
;473:  int value = cg.snap->ps.persistant[PERS_SCORE];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ASGNI4
line 475
;474:
;475:	if (shader) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $388
line 476
;476:		trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 477
;477:		CG_DrawPic(rect->x, rect->y, rect->w, rect->h, shader);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 478
;478:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 479
;479:	} else {
ADDRGP4 $389
JUMPV
LABELV $388
line 480
;480:		Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $203
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 481
;481:		value = CG_Text_Width(num, scale, 0);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 482
;482:	  CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 483
;483:	}
LABELV $389
line 484
;484:}
LABELV $386
endproc CG_DrawPlayerScore 28 32
proc CG_DrawPlayerItem 36 32
line 486
;485:
;486:static void CG_DrawPlayerItem( rectDef_t *rect, float scale, qboolean draw2D) {
line 490
;487:	int		value;
;488:  vec3_t origin, angles;
;489:
;490:	value = cg.snap->ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
line 491
;491:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $392
line 492
;492:		CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 494
;493:
;494:		if (qtrue) {
line 495
;495:		  CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 496
;496:		  CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cg_items[ value ].icon );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 497
;497:		} else {
ADDRGP4 $395
JUMPV
LABELV $394
line 498
;498: 			VectorClear( angles );
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 4+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
line 499
;499:			origin[0] = 90;
ADDRLP4 16
CNSTF4 1119092736
ASGNF4
line 500
;500:  		origin[1] = 0;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 501
;501:   		origin[2] = -10;
ADDRLP4 16+8
CNSTF4 3240099840
ASGNF4
line 502
;502:  		angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRLP4 4+4
CNSTI4 360
ADDRGP4 cg+107604
INDIRI4
CNSTI4 2047
BANDI4
MULI4
CVIF4 4
CNSTF4 1157627904
DIVF4
ASGNF4
line 503
;503:			CG_Draw3DModel(rect->x, rect->y, rect->w, rect->h, cg_items[ value ].models[0], 0, origin, angles );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_items+4
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 504
;504:		}
LABELV $395
line 505
;505:	}
LABELV $392
line 507
;506:
;507:}
LABELV $390
endproc CG_DrawPlayerItem 36 32
proc CG_DrawSelectedPlayerPowerup 36 20
line 510
;508:
;509:
;510:static void CG_DrawSelectedPlayerPowerup( rectDef_t *rect, qboolean draw2D ) {
line 515
;511:	clientInfo_t *ci;
;512:  int j;
;513:  float x, y;
;514:
;515:  ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 16
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 4
CNSTI4 1708
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 516
;516:  if (ci) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $406
line 517
;517:    x = rect->x;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 518
;518:    y = rect->y;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 520
;519:
;520:		for (j = 0; j < PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $408
line 521
;521:			if (ci->powerups & (1 << j)) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $412
line 523
;522:				gitem_t	*item;
;523:				item = BG_FindItemForPowerup( j );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
ASGNP4
line 524
;524:				if (item) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $414
line 525
;525:				  CG_DrawPic( x, y, rect->w, rect->h, trap_R_RegisterShader( item->icon ) );
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 526
;526:					x += 3;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1077936128
ADDF4
ASGNF4
line 527
;527:					y += 3;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1077936128
ADDF4
ASGNF4
line 528
;528:          return;
ADDRGP4 $404
JUMPV
LABELV $414
line 530
;529:				}
;530:			}
LABELV $412
line 531
;531:		}
LABELV $409
line 520
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $408
line 533
;532:
;533:  }
LABELV $406
line 534
;534:}
LABELV $404
endproc CG_DrawSelectedPlayerPowerup 36 20
proc CG_DrawSelectedPlayerHead 80 32
line 537
;535:
;536:
;537:static void CG_DrawSelectedPlayerHead( rectDef_t *rect, qboolean draw2D, qboolean voice ) {
line 545
;538:	clipHandle_t	cm;
;539:	clientInfo_t	*ci;
;540:	float			len;
;541:	vec3_t			origin;
;542:	vec3_t			mins, maxs, angles;
;543:
;544:
;545:  ci = cgs.clientinfo + ((voice) ? cgs.currentVoiceClient : sortedTeamPlayers[CG_GetSelectedPlayer()]);
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $420
ADDRLP4 60
ADDRGP4 cgs+152292
INDIRI4
ASGNI4
ADDRGP4 $421
JUMPV
LABELV $420
ADDRLP4 64
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
ASGNI4
LABELV $421
ADDRLP4 0
CNSTI4 1708
ADDRLP4 60
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 547
;546:
;547:  if (ci) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $422
line 548
;548:  	if ( cg_draw3dIcons.integer ) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $424
line 549
;549:	  	cm = ci->headModel;
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 550
;550:  		if ( !cm ) {
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $427
line 551
;551:  			return;
ADDRGP4 $416
JUMPV
LABELV $427
line 555
;552:	  	}
;553:
;554:  		// offset the origin y and z to center the head
;555:  		trap_R_ModelBounds( cm, mins, maxs );
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 557
;556:
;557:	  	origin[2] = -0.5 * ( mins[2] + maxs[2] );
ADDRLP4 4+8
CNSTF4 3204448256
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 558
;558:  		origin[1] = 0.5 * ( mins[1] + maxs[1] );
ADDRLP4 4+4
CNSTF4 1056964608
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDF4
MULF4
ASGNF4
line 562
;559:
;560:	  	// calculate distance so the head nearly fills the box
;561:  		// assume heads are taller than wide
;562:  		len = 0.7 * ( maxs[2] - mins[2] );		
ADDRLP4 56
CNSTF4 1060320051
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
MULF4
ASGNF4
line 563
;563:  		origin[0] = len / 0.268;	// len / tan( fov/2 )
ADDRLP4 4
ADDRLP4 56
INDIRF4
CNSTF4 1049179980
DIVF4
ASGNF4
line 566
;564:
;565:  		// allow per-model tweaking
;566:  		VectorAdd( origin, ci->headOffset, origin );
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
ADDF4
ASGNF4
line 568
;567:
;568:    	angles[PITCH] = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 569
;569:    	angles[YAW] = 180;
ADDRLP4 40+4
CNSTF4 1127481344
ASGNF4
line 570
;570:    	angles[ROLL] = 0;
ADDRLP4 40+8
CNSTF4 0
ASGNF4
line 572
;571:  	
;572:      CG_Draw3DModel( rect->x, rect->y, rect->w, rect->h, ci->headModel, ci->headSkin, origin, angles );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
INDIRF4
ARGF4
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 72
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 72
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 573
;573:  	} else if ( cg_drawIcons.integer ) {
ADDRGP4 $425
JUMPV
LABELV $424
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $443
line 574
;574:	  	CG_DrawPic( rect->x, rect->y, rect->w, rect->h, ci->modelIcon );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 575
;575:  	}
LABELV $443
LABELV $425
line 578
;576:
;577:  	// if they are deferred, draw a cross out
;578:  	if ( ci->deferred ) {
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $446
line 579
;579:  		CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.deferShader );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+152340+164
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 580
;580:  	}
LABELV $446
line 581
;581:  }
LABELV $422
line 583
;582:
;583:}
LABELV $416
endproc CG_DrawSelectedPlayerHead 80 32
proc CG_DrawPlayerHealth 32 32
line 586
;584:
;585:
;586:static void CG_DrawPlayerHealth(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 591
;587:	playerState_t	*ps;
;588:  int value;
;589:	char	num[16];
;590:
;591:	ps = &cg.snap->ps;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 593
;592:
;593:	value = ps->stats[STAT_HEALTH];
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 595
;594:
;595:	if (shader) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $452
line 596
;596:		trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 597
;597:		CG_DrawPic(rect->x, rect->y, rect->w, rect->h, shader);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 598
;598:		trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 599
;599:	} else {
ADDRGP4 $453
JUMPV
LABELV $452
line 600
;600:		Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $203
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 601
;601:	  value = CG_Text_Width(num, scale, 0);
ADDRLP4 8
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 602
;602:	  CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 603
;603:	}
LABELV $453
line 604
;604:}
LABELV $450
endproc CG_DrawPlayerHealth 32 32
proc CG_DrawRedScore 28 32
line 607
;605:
;606:
;607:static void CG_DrawRedScore(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 610
;608:	int value;
;609:	char num[16];
;610:	if ( cgs.scores1 == SCORE_NOT_PRESENT ) {
ADDRGP4 cgs+34800
INDIRI4
CNSTI4 -9999
NEI4 $455
line 611
;611:		Com_sprintf (num, sizeof(num), "-");
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $458
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 612
;612:	}
ADDRGP4 $456
JUMPV
LABELV $455
line 613
;613:	else {
line 614
;614:		Com_sprintf (num, sizeof(num), "%i", cgs.scores1);
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $203
ARGP4
ADDRGP4 cgs+34800
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 615
;615:	}
LABELV $456
line 616
;616:	value = CG_Text_Width(num, scale, 0);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 617
;617:	CG_Text_Paint(rect->x + rect->w - value, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ADDRLP4 16
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 618
;618:}
LABELV $454
endproc CG_DrawRedScore 28 32
proc CG_DrawBlueScore 28 32
line 620
;619:
;620:static void CG_DrawBlueScore(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 624
;621:	int value;
;622:	char num[16];
;623:
;624:	if ( cgs.scores2 == SCORE_NOT_PRESENT ) {
ADDRGP4 cgs+34804
INDIRI4
CNSTI4 -9999
NEI4 $461
line 625
;625:		Com_sprintf (num, sizeof(num), "-");
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $458
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 626
;626:	}
ADDRGP4 $462
JUMPV
LABELV $461
line 627
;627:	else {
line 628
;628:		Com_sprintf (num, sizeof(num), "%i", cgs.scores2);
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $203
ARGP4
ADDRGP4 cgs+34804
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 629
;629:	}
LABELV $462
line 630
;630:	value = CG_Text_Width(num, scale, 0);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 631
;631:	CG_Text_Paint(rect->x + rect->w - value, rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ADDRLP4 16
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 632
;632:}
LABELV $460
endproc CG_DrawBlueScore 28 32
proc CG_DrawRedName 4 32
line 635
;633:
;634:// FIXME: team name support
;635:static void CG_DrawRedName(rectDef_t *rect, float scale, vec4_t color, int textStyle ) {
line 636
;636:  CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, cg_redTeamName.string , 0, 0, textStyle);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 cg_redTeamName+16
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 637
;637:}
LABELV $465
endproc CG_DrawRedName 4 32
proc CG_DrawBlueName 4 32
line 639
;638:
;639:static void CG_DrawBlueName(rectDef_t *rect, float scale, vec4_t color, int textStyle ) {
line 640
;640:  CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, cg_blueTeamName.string, 0, 0, textStyle);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 cg_blueTeamName+16
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 641
;641:}
LABELV $467
endproc CG_DrawBlueName 4 32
proc CG_DrawBlueFlagName 16 32
line 643
;642:
;643:static void CG_DrawBlueFlagName(rectDef_t *rect, float scale, vec4_t color, int textStyle ) {
line 645
;644:  int i;
;645:  for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $473
JUMPV
LABELV $470
line 646
;646:	  if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_RED  && cgs.clientinfo[i].powerups & ( 1<< PW_BLUEFLAG )) {
ADDRLP4 4
CNSTI4 1708
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $475
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $475
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+140
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $475
line 647
;647:      CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, cgs.clientinfo[i].name, 0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1708
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972+4
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 648
;648:      return;
ADDRGP4 $469
JUMPV
LABELV $475
line 650
;649:    }
;650:  }
LABELV $471
line 645
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $473
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $470
line 651
;651:}
LABELV $469
endproc CG_DrawBlueFlagName 16 32
lit
align 4
LABELV $492
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $499
byte 4 0
byte 4 0
byte 4 1065353216
byte 4 1065353216
code
proc CG_DrawBlueFlagStatus 28 20
line 653
;652:
;653:static void CG_DrawBlueFlagStatus(rectDef_t *rect, qhandle_t shader) {
line 654
;654:	if (cgs.gametype != GT_CTF && cgs.gametype != GT_1FCTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $485
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
EQI4 $485
line 655
;655:		if (cgs.gametype == GT_HARVESTER) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 7
NEI4 $484
line 656
;656:		  vec4_t color = {0, 0, 1, 1};
ADDRLP4 0
ADDRGP4 $492
INDIRB
ASGNB 16
line 657
;657:		  trap_R_SetColor(color);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 658
;658:	    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.blueCubeIcon );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+152340+32
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 659
;659:		  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 660
;660:		}
line 661
;661:		return;
ADDRGP4 $484
JUMPV
LABELV $485
line 663
;662:	}
;663:  if (shader) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $495
line 664
;664:		CG_DrawPic( rect->x, rect->y, rect->w, rect->h, shader );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 665
;665:  } else {
ADDRGP4 $496
JUMPV
LABELV $495
line 666
;666:	  gitem_t *item = BG_FindItemForPowerup( PW_BLUEFLAG );
CNSTI4 8
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 667
;667:    if (item) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $497
line 668
;668:		  vec4_t color = {0, 0, 1, 1};
ADDRLP4 8
ADDRGP4 $499
INDIRB
ASGNB 16
line 669
;669:		  trap_R_SetColor(color);
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 670
;670:	    if( cgs.blueflag >= 0 && cgs.blueflag <= 2 ) {
ADDRGP4 cgs+34812
INDIRI4
CNSTI4 0
LTI4 $500
ADDRGP4 cgs+34812
INDIRI4
CNSTI4 2
GTI4 $500
line 671
;671:		    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.flagShaders[cgs.blueflag] );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+34812
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+1188
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 672
;672:			} else {
ADDRGP4 $501
JUMPV
LABELV $500
line 673
;673:		    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.flagShaders[0] );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+152340+1188
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 674
;674:			}
LABELV $501
line 675
;675:		  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 676
;676:	  }
LABELV $497
line 677
;677:  }
LABELV $496
line 678
;678:}
LABELV $484
endproc CG_DrawBlueFlagStatus 28 20
proc CG_DrawBlueFlagHead 36 24
line 680
;679:
;680:static void CG_DrawBlueFlagHead(rectDef_t *rect) {
line 682
;681:  int i;
;682:  for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $513
JUMPV
LABELV $510
line 683
;683:	  if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_RED  && cgs.clientinfo[i].powerups & ( 1<< PW_BLUEFLAG )) {
ADDRLP4 4
CNSTI4 1708
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $515
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $515
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+140
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $515
line 685
;684:      vec3_t angles;
;685:      VectorClear( angles );
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 686
;686: 		  angles[YAW] = 180 + 20 * sin( cg.time / 650.0 );;
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1143111680
DIVF4
ARGF4
ADDRLP4 28
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 12+4
CNSTF4 1101004800
ADDRLP4 28
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 687
;687:      CG_DrawHead( rect->x, rect->y, rect->w, rect->h, 0,angles );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 688
;688:      return;
ADDRGP4 $509
JUMPV
LABELV $515
line 690
;689:    }
;690:  }
LABELV $511
line 682
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $513
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $510
line 691
;691:}
LABELV $509
endproc CG_DrawBlueFlagHead 36 24
proc CG_DrawRedFlagName 16 32
line 693
;692:
;693:static void CG_DrawRedFlagName(rectDef_t *rect, float scale, vec4_t color, int textStyle ) {
line 695
;694:  int i;
;695:  for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $530
JUMPV
LABELV $527
line 696
;696:	  if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_BLUE  && cgs.clientinfo[i].powerups & ( 1<< PW_REDFLAG )) {
ADDRLP4 4
CNSTI4 1708
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $532
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $532
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+140
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $532
line 697
;697:      CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, cgs.clientinfo[i].name, 0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1708
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cgs+40972+4
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 698
;698:      return;
ADDRGP4 $526
JUMPV
LABELV $532
line 700
;699:    }
;700:  }
LABELV $528
line 695
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $530
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $527
line 701
;701:}
LABELV $526
endproc CG_DrawRedFlagName 16 32
lit
align 4
LABELV $549
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $556
byte 4 1065353216
byte 4 0
byte 4 0
byte 4 1065353216
code
proc CG_DrawRedFlagStatus 28 20
line 703
;702:
;703:static void CG_DrawRedFlagStatus(rectDef_t *rect, qhandle_t shader) {
line 704
;704:	if (cgs.gametype != GT_CTF && cgs.gametype != GT_1FCTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $542
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
EQI4 $542
line 705
;705:		if (cgs.gametype == GT_HARVESTER) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 7
NEI4 $541
line 706
;706:		  vec4_t color = {1, 0, 0, 1};
ADDRLP4 0
ADDRGP4 $549
INDIRB
ASGNB 16
line 707
;707:		  trap_R_SetColor(color);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 708
;708:	    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.redCubeIcon );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+152340+28
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 709
;709:		  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 710
;710:		}
line 711
;711:		return;
ADDRGP4 $541
JUMPV
LABELV $542
line 713
;712:	}
;713:  if (shader) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $552
line 714
;714:		CG_DrawPic( rect->x, rect->y, rect->w, rect->h, shader );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 715
;715:  } else {
ADDRGP4 $553
JUMPV
LABELV $552
line 716
;716:	  gitem_t *item = BG_FindItemForPowerup( PW_REDFLAG );
CNSTI4 7
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 717
;717:    if (item) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $554
line 718
;718:		  vec4_t color = {1, 0, 0, 1};
ADDRLP4 8
ADDRGP4 $556
INDIRB
ASGNB 16
line 719
;719:		  trap_R_SetColor(color);
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 720
;720:	    if( cgs.redflag >= 0 && cgs.redflag <= 2) {
ADDRGP4 cgs+34808
INDIRI4
CNSTI4 0
LTI4 $557
ADDRGP4 cgs+34808
INDIRI4
CNSTI4 2
GTI4 $557
line 721
;721:		    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.flagShaders[cgs.redflag] );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+34808
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+1188
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 722
;722:			} else {
ADDRGP4 $558
JUMPV
LABELV $557
line 723
;723:		    CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.flagShaders[0] );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 cgs+152340+1188
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 724
;724:			}
LABELV $558
line 725
;725:		  trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 726
;726:	  }
LABELV $554
line 727
;727:  }
LABELV $553
line 728
;728:}
LABELV $541
endproc CG_DrawRedFlagStatus 28 20
proc CG_DrawRedFlagHead 36 24
line 730
;729:
;730:static void CG_DrawRedFlagHead(rectDef_t *rect) {
line 732
;731:  int i;
;732:  for ( i = 0 ; i < cgs.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $570
JUMPV
LABELV $567
line 733
;733:	  if ( cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_BLUE  && cgs.clientinfo[i].powerups & ( 1<< PW_REDFLAG )) {
ADDRLP4 4
CNSTI4 1708
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $572
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $572
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+140
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $572
line 735
;734:      vec3_t angles;
;735:      VectorClear( angles );
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 736
;736: 		  angles[YAW] = 180 + 20 * sin( cg.time / 650.0 );;
ADDRGP4 cg+107604
INDIRI4
CVIF4 4
CNSTF4 1143111680
DIVF4
ARGF4
ADDRLP4 28
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 12+4
CNSTF4 1101004800
ADDRLP4 28
INDIRF4
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 737
;737:      CG_DrawHead( rect->x, rect->y, rect->w, rect->h, 0,angles );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 738
;738:      return;
ADDRGP4 $566
JUMPV
LABELV $572
line 740
;739:    }
;740:  }
LABELV $568
line 732
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $570
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $567
line 741
;741:}
LABELV $566
endproc CG_DrawRedFlagHead 36 24
proc CG_HarvesterSkulls 72 32
line 743
;742:
;743:static void CG_HarvesterSkulls(rectDef_t *rect, float scale, vec4_t color, qboolean force2D, int textStyle ) {
line 747
;744:	char num[16];
;745:	vec3_t origin, angles;
;746:	qhandle_t handle;
;747:	int value = cg.snap->ps.generic1;
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
ASGNI4
line 749
;748:
;749:	if (cgs.gametype != GT_HARVESTER) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 7
EQI4 $585
line 750
;750:		return;
ADDRGP4 $583
JUMPV
LABELV $585
line 753
;751:	}
;752:
;753:	if( value > 99 ) {
ADDRLP4 0
INDIRI4
CNSTI4 99
LEI4 $588
line 754
;754:		value = 99;
ADDRLP4 0
CNSTI4 99
ASGNI4
line 755
;755:	}
LABELV $588
line 757
;756:
;757:	Com_sprintf (num, sizeof(num), "%i", value);
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $203
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 758
;758:	value = CG_Text_Width(num, scale, 0);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 48
INDIRI4
ASGNI4
line 759
;759:	CG_Text_Paint(rect->x + (rect->w - value), rect->y + rect->h, scale, color, num, 0, 0, textStyle);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
SUBF4
ADDF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 761
;760:
;761:	if (cg_drawIcons.integer) {
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $590
line 762
;762:		if (!force2D && cg_draw3dIcons.integer) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRFP4 12
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $593
ADDRGP4 cg_draw3dIcons+12
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $593
line 763
;763:			VectorClear(angles);
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 20+8
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 60
INDIRF4
ASGNF4
line 764
;764:			origin[0] = 90;
ADDRLP4 32
CNSTF4 1119092736
ASGNF4
line 765
;765:			origin[1] = 0;
ADDRLP4 32+4
CNSTF4 0
ASGNF4
line 766
;766:			origin[2] = -10;
ADDRLP4 32+8
CNSTF4 3240099840
ASGNF4
line 767
;767:			angles[YAW] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRLP4 20+4
CNSTI4 360
ADDRGP4 cg+107604
INDIRI4
CNSTI4 2047
BANDI4
MULI4
CVIF4 4
CNSTF4 1157627904
DIVF4
ASGNF4
line 768
;768:			if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $602
line 769
;769:				handle = cgs.media.redCubeModel;
ADDRLP4 44
ADDRGP4 cgs+152340+20
INDIRI4
ASGNI4
line 770
;770:			} else {
ADDRGP4 $603
JUMPV
LABELV $602
line 771
;771:				handle = cgs.media.blueCubeModel;
ADDRLP4 44
ADDRGP4 cgs+152340+24
INDIRI4
ASGNI4
line 772
;772:			}
LABELV $603
line 773
;773:			CG_Draw3DModel( rect->x, rect->y, 35, 35, handle, 0, origin, angles );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
INDIRF4
ARGF4
ADDRLP4 64
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
CNSTF4 1108082688
ASGNF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 774
;774:		} else {
ADDRGP4 $594
JUMPV
LABELV $593
line 775
;775:			if( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $609
line 776
;776:				handle = cgs.media.redCubeIcon;
ADDRLP4 44
ADDRGP4 cgs+152340+28
INDIRI4
ASGNI4
line 777
;777:			} else {
ADDRGP4 $610
JUMPV
LABELV $609
line 778
;778:				handle = cgs.media.blueCubeIcon;
ADDRLP4 44
ADDRGP4 cgs+152340+32
INDIRI4
ASGNI4
line 779
;779:			}
LABELV $610
line 780
;780:			CG_DrawPic( rect->x + 3, rect->y + 16, 20, 20, handle );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTF4 1077936128
ADDF4
ARGF4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
ARGF4
ADDRLP4 64
CNSTF4 1101004800
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 781
;781:		}
LABELV $594
line 782
;782:	}
LABELV $590
line 783
;783:}
LABELV $583
endproc CG_HarvesterSkulls 72 32
lit
align 4
LABELV $626
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
code
proc CG_OneFlagStatus 32 20
line 785
;784:
;785:static void CG_OneFlagStatus(rectDef_t *rect) {
line 786
;786:	if (cgs.gametype != GT_1FCTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
EQI4 $617
line 787
;787:		return;
ADDRGP4 $616
JUMPV
LABELV $617
line 788
;788:	} else {
line 789
;789:		gitem_t *item = BG_FindItemForPowerup( PW_NEUTRALFLAG );
CNSTI4 9
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 790
;790:		if (item) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $620
line 791
;791:			if( cgs.flagStatus >= 0 && cgs.flagStatus <= 4 ) {
ADDRGP4 cgs+34816
INDIRI4
CNSTI4 0
LTI4 $622
ADDRGP4 cgs+34816
INDIRI4
CNSTI4 4
GTI4 $622
line 792
;792:				vec4_t color = {1, 1, 1, 1};
ADDRLP4 8
ADDRGP4 $626
INDIRB
ASGNB 16
line 793
;793:				int index = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 794
;794:				if (cgs.flagStatus == FLAG_TAKEN_RED) {
ADDRGP4 cgs+34816
INDIRI4
CNSTI4 2
NEI4 $627
line 795
;795:					color[1] = color[2] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 8+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 28
INDIRF4
ASGNF4
line 796
;796:					index = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 797
;797:				} else if (cgs.flagStatus == FLAG_TAKEN_BLUE) {
ADDRGP4 $628
JUMPV
LABELV $627
ADDRGP4 cgs+34816
INDIRI4
CNSTI4 3
NEI4 $632
line 798
;798:					color[0] = color[1] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 8+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 28
INDIRF4
ASGNF4
line 799
;799:					index = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 800
;800:				} else if (cgs.flagStatus == FLAG_DROPPED) {
ADDRGP4 $633
JUMPV
LABELV $632
ADDRGP4 cgs+34816
INDIRI4
CNSTI4 4
NEI4 $636
line 801
;801:					index = 2;
ADDRLP4 24
CNSTI4 2
ASGNI4
line 802
;802:				}
LABELV $636
LABELV $633
LABELV $628
line 803
;803:			  trap_R_SetColor(color);
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 804
;804:				CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cgs.media.flagShaders[index] );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+1188
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 805
;805:			}
LABELV $622
line 806
;806:		}
LABELV $620
line 807
;807:	}
line 808
;808:}
LABELV $616
endproc CG_OneFlagStatus 32 20
proc CG_DrawCTFPowerUp 8 20
line 811
;809:
;810:
;811:static void CG_DrawCTFPowerUp(rectDef_t *rect) {
line 814
;812:	int		value;
;813:
;814:	if (cgs.gametype < GT_CTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
GEI4 $642
line 815
;815:		return;
ADDRGP4 $641
JUMPV
LABELV $642
line 817
;816:	}
;817:	value = cg.snap->ps.stats[STAT_PERSISTANT_POWERUP];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 818
;818:	if ( value ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $646
line 819
;819:		CG_RegisterItemVisuals( value );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 820
;820:		CG_DrawPic( rect->x, rect->y, rect->w, rect->h, cg_items[ value ].icon );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 821
;821:	}
LABELV $646
line 822
;822:}
LABELV $641
endproc CG_DrawCTFPowerUp 8 20
proc CG_DrawTeamColor 8 24
line 826
;823:
;824:
;825:
;826:static void CG_DrawTeamColor(rectDef_t *rect, vec4_t color) {
line 827
;827:	CG_DrawTeamBackground(rect->x, rect->y, rect->w, rect->h, color[3], cg.snap->ps.persistant[PERS_TEAM]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 4
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawTeamBackground
CALLV
pop
line 828
;828:}
LABELV $649
endproc CG_DrawTeamColor 8 24
proc CG_DrawAreaPowerUp 232 32
line 830
;829:
;830:static void CG_DrawAreaPowerUp(rectDef_t *rect, int align, float special, float scale, vec4_t color) {
line 842
;831:	char num[16];
;832:	int		sorted[MAX_POWERUPS];
;833:	int		sortedTime[MAX_POWERUPS];
;834:	int		i, j, k;
;835:	int		active;
;836:	playerState_t	*ps;
;837:	int		t;
;838:	gitem_t	*item;
;839:	float	f;
;840:	rectDef_t r2;
;841:	float *inc;
;842:	r2.x = rect->x;
ADDRLP4 148
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 843
;843:	r2.y = rect->y;
ADDRLP4 148+4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 844
;844:	r2.w = rect->w;
ADDRLP4 148+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 845
;845:	r2.h = rect->h;
ADDRLP4 148+12
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 847
;846:
;847:	inc = (align == HUD_VERTICAL) ? &r2.y : &r2.x;
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $657
ADDRLP4 196
ADDRLP4 148+4
ASGNP4
ADDRGP4 $658
JUMPV
LABELV $657
ADDRLP4 196
ADDRLP4 148
ASGNP4
LABELV $658
ADDRLP4 192
ADDRLP4 196
INDIRP4
ASGNP4
line 849
;848:
;849:	ps = &cg.snap->ps;
ADDRLP4 164
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 851
;850:
;851:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 164
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $660
line 852
;852:		return;
ADDRGP4 $651
JUMPV
LABELV $660
line 856
;853:	}
;854:
;855:	// sort the list by time remaining
;856:	active = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 857
;857:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
LABELV $662
line 858
;858:		if ( !ps->powerups[ i ] ) {
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 164
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $666
line 859
;859:			continue;
ADDRGP4 $663
JUMPV
LABELV $666
line 861
;860:		}
;861:		t = ps->powerups[ i ] - cg.time;
ADDRLP4 140
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 164
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
ASGNI4
line 864
;862:		// ZOID--don't draw if the power up has unlimited time (999 seconds)
;863:		// This is true of the CTF flags
;864:		if ( t <= 0 || t >= 999000) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LEI4 $671
ADDRLP4 140
INDIRI4
CNSTI4 999000
LTI4 $669
LABELV $671
line 865
;865:			continue;
ADDRGP4 $663
JUMPV
LABELV $669
line 869
;866:		}
;867:
;868:		// insert into the list
;869:		for ( j = 0 ; j < active ; j++ ) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $675
JUMPV
LABELV $672
line 870
;870:			if ( sortedTime[j] >= t ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $676
line 871
;871:				for ( k = active - 1 ; k >= j ; k-- ) {
ADDRLP4 0
ADDRLP4 136
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $681
JUMPV
LABELV $678
line 872
;872:					sorted[k+1] = sorted[k];
ADDRLP4 204
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 204
INDIRI4
ADDRLP4 68+4
ADDP4
ADDRLP4 204
INDIRI4
ADDRLP4 68
ADDP4
INDIRI4
ASGNI4
line 873
;873:					sortedTime[k+1] = sortedTime[k];
ADDRLP4 208
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 208
INDIRI4
ADDRLP4 4+4
ADDP4
ADDRLP4 208
INDIRI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 874
;874:				}
LABELV $679
line 871
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $681
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
GEI4 $678
line 875
;875:				break;
ADDRGP4 $674
JUMPV
LABELV $676
line 877
;876:			}
;877:		}
LABELV $673
line 869
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $675
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $672
LABELV $674
line 878
;878:		sorted[j] = i;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 879
;879:		sortedTime[j] = t;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 880
;880:		active++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 881
;881:	}
LABELV $663
line 857
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 16
LTI4 $662
line 884
;882:
;883:	// draw the icons and timers
;884:	for ( i = 0 ; i < active ; i++ ) {
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRGP4 $687
JUMPV
LABELV $684
line 885
;885:		item = BG_FindItemForPowerup( sorted[i] );
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 200
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 168
ADDRLP4 200
INDIRP4
ASGNP4
line 887
;886:
;887:		if (item) {
ADDRLP4 168
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $688
line 888
;888:			t = ps->powerups[ sorted[i] ];
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 140
ADDRLP4 144
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 164
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ASGNI4
line 889
;889:			if ( t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME ) {
ADDRLP4 140
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $690
line 890
;890:				trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 891
;891:			} else {
ADDRGP4 $691
JUMPV
LABELV $690
line 894
;892:				vec4_t	modulate;
;893:
;894:				f = (float)( t - cg.time ) / POWERUP_BLINK_TIME;
ADDRLP4 188
ADDRLP4 140
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 895
;895:				f -= (int)f;
ADDRLP4 188
ADDRLP4 188
INDIRF4
ADDRLP4 188
INDIRF4
CVFI4 4
CVIF4 4
SUBF4
ASGNF4
line 896
;896:				modulate[0] = modulate[1] = modulate[2] = modulate[3] = f;
ADDRLP4 208+12
ADDRLP4 188
INDIRF4
ASGNF4
ADDRLP4 208+8
ADDRLP4 188
INDIRF4
ASGNF4
ADDRLP4 208+4
ADDRLP4 188
INDIRF4
ASGNF4
ADDRLP4 208
ADDRLP4 188
INDIRF4
ASGNF4
line 897
;897:				trap_R_SetColor( modulate );
ADDRLP4 208
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 898
;898:			}
LABELV $691
line 900
;899:
;900:			CG_DrawPic( r2.x, r2.y, r2.w * .75, r2.h, trap_R_RegisterShader( item->icon ) );
ADDRLP4 168
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 148
INDIRF4
ARGF4
ADDRLP4 148+4
INDIRF4
ARGF4
CNSTF4 1061158912
ADDRLP4 148+8
INDIRF4
MULF4
ARGF4
ADDRLP4 148+12
INDIRF4
ARGF4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 902
;901:
;902:			Com_sprintf (num, sizeof(num), "%i", sortedTime[i] / 1000);
ADDRLP4 172
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $203
ARGP4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 903
;903:			CG_Text_Paint(r2.x + (r2.w * .75) + 3 , r2.y + r2.h, scale, color, num, 0, 0, 0);
ADDRLP4 148
INDIRF4
CNSTF4 1061158912
ADDRLP4 148+8
INDIRF4
MULF4
ADDF4
CNSTF4 1077936128
ADDF4
ARGF4
ADDRLP4 148+4
INDIRF4
ADDRLP4 148+12
INDIRF4
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 172
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 212
CNSTI4 0
ASGNI4
ADDRLP4 212
INDIRI4
ARGI4
ADDRLP4 212
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 904
;904:			*inc += r2.w + special;
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
ADDRLP4 148+8
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 905
;905:		}
LABELV $688
line 907
;906:
;907:	}
LABELV $685
line 884
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $687
ADDRLP4 144
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $684
line 908
;908:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 910
;909:
;910:}
LABELV $651
endproc CG_DrawAreaPowerUp 232 32
export CG_GetValue
proc CG_GetValue 44 0
line 912
;911:
;912:float CG_GetValue(int ownerDraw) {
line 917
;913:	centity_t	*cent;
;914: 	clientInfo_t *ci;
;915:	playerState_t	*ps;
;916:
;917:  cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 4
CNSTI4 728
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 918
;918:	ps = &cg.snap->ps;
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 920
;919:
;920:  switch (ownerDraw) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
CNSTI4 20
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $717
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
GTI4 $725
LABELV $724
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $713
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $719
ADDRLP4 20
INDIRI4
CNSTI4 6
EQI4 $714
ADDRGP4 $708
JUMPV
LABELV $725
ADDRLP4 24
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 27
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $722
ADDRLP4 24
INDIRI4
CNSTI4 28
EQI4 $720
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $708
LABELV $726
ADDRLP4 32
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 40
EQI4 $709
ADDRLP4 32
INDIRI4
CNSTI4 41
EQI4 $711
ADDRGP4 $708
JUMPV
LABELV $709
line 922
;921:  case CG_SELECTEDPLAYER_ARMOR:
;922:    ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 36
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 8
CNSTI4 1708
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 923
;923:    return ci->armor;
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $704
JUMPV
line 924
;924:    break;
LABELV $711
line 926
;925:  case CG_SELECTEDPLAYER_HEALTH:
;926:    ci = cgs.clientinfo + sortedTeamPlayers[CG_GetSelectedPlayer()];
ADDRLP4 40
ADDRGP4 CG_GetSelectedPlayer
CALLI4
ASGNI4
ADDRLP4 8
CNSTI4 1708
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 927
;927:    return ci->health;
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $704
JUMPV
line 928
;928:    break;
LABELV $713
line 930
;929:  case CG_PLAYER_ARMOR_VALUE:
;930:		return ps->stats[STAT_ARMOR];
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $704
JUMPV
line 931
;931:    break;
LABELV $714
line 933
;932:  case CG_PLAYER_AMMO_VALUE:
;933:		if ( cent->currentState.weapon ) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $708
line 934
;934:		  return ps->ammo[cent->currentState.weapon];
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $704
JUMPV
line 936
;935:		}
;936:    break;
LABELV $717
line 938
;937:  case CG_PLAYER_SCORE:
;938:	  return cg.snap->ps.persistant[PERS_SCORE];
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $704
JUMPV
line 939
;939:    break;
LABELV $719
line 941
;940:  case CG_PLAYER_HEALTH:
;941:		return ps->stats[STAT_HEALTH];
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $704
JUMPV
line 942
;942:    break;
LABELV $720
line 944
;943:  case CG_RED_SCORE:
;944:		return cgs.scores1;
ADDRGP4 cgs+34800
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $704
JUMPV
line 945
;945:    break;
LABELV $722
line 947
;946:  case CG_BLUE_SCORE:
;947:		return cgs.scores2;
ADDRGP4 cgs+34804
INDIRI4
CVIF4 4
RETF4
ADDRGP4 $704
JUMPV
line 948
;948:    break;
line 950
;949:  default:
;950:    break;
LABELV $708
line 952
;951:  }
;952:	return -1;
CNSTF4 3212836864
RETF4
LABELV $704
endproc CG_GetValue 44 0
export CG_OtherTeamHasFlag
proc CG_OtherTeamHasFlag 8 0
line 955
;953:}
;954:
;955:qboolean CG_OtherTeamHasFlag() {
line 956
;956:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $732
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
NEI4 $728
LABELV $732
line 957
;957:		int team = cg.snap->ps.persistant[PERS_TEAM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ASGNI4
line 958
;958:		if (cgs.gametype == GT_1FCTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
NEI4 $734
line 959
;959:			if (team == TEAM_RED && cgs.flagStatus == FLAG_TAKEN_BLUE) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $737
ADDRGP4 cgs+34816
INDIRI4
CNSTI4 3
NEI4 $737
line 960
;960:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $727
JUMPV
LABELV $737
line 961
;961:			} else if (team == TEAM_BLUE && cgs.flagStatus == FLAG_TAKEN_RED) {
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $740
ADDRGP4 cgs+34816
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $740
line 962
;962:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $727
JUMPV
LABELV $740
line 963
;963:			} else {
line 964
;964:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $727
JUMPV
LABELV $734
line 966
;965:			}
;966:		} else {
line 967
;967:			if (team == TEAM_RED && cgs.redflag == FLAG_TAKEN) {
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $743
ADDRGP4 cgs+34808
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $743
line 968
;968:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $727
JUMPV
LABELV $743
line 969
;969:			} else if (team == TEAM_BLUE && cgs.blueflag == FLAG_TAKEN) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $746
ADDRGP4 cgs+34812
INDIRI4
CNSTI4 1
NEI4 $746
line 970
;970:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $727
JUMPV
LABELV $746
line 971
;971:			} else {
line 972
;972:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $727
JUMPV
LABELV $728
line 976
;973:			}
;974:		}
;975:	}
;976:	return qfalse;
CNSTI4 0
RETI4
LABELV $727
endproc CG_OtherTeamHasFlag 8 0
export CG_YourTeamHasFlag
proc CG_YourTeamHasFlag 8 0
line 979
;977:}
;978:
;979:qboolean CG_YourTeamHasFlag() {
line 980
;980:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
EQI4 $754
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
NEI4 $750
LABELV $754
line 981
;981:		int team = cg.snap->ps.persistant[PERS_TEAM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ASGNI4
line 982
;982:		if (cgs.gametype == GT_1FCTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
NEI4 $756
line 983
;983:			if (team == TEAM_RED && cgs.flagStatus == FLAG_TAKEN_RED) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $759
ADDRGP4 cgs+34816
INDIRI4
CNSTI4 2
NEI4 $759
line 984
;984:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $749
JUMPV
LABELV $759
line 985
;985:			} else if (team == TEAM_BLUE && cgs.flagStatus == FLAG_TAKEN_BLUE) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $762
ADDRGP4 cgs+34816
INDIRI4
CNSTI4 3
NEI4 $762
line 986
;986:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $749
JUMPV
LABELV $762
line 987
;987:			} else {
line 988
;988:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $749
JUMPV
LABELV $756
line 990
;989:			}
;990:		} else {
line 991
;991:			if (team == TEAM_RED && cgs.blueflag == FLAG_TAKEN) {
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $765
ADDRGP4 cgs+34812
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $765
line 992
;992:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $749
JUMPV
LABELV $765
line 993
;993:			} else if (team == TEAM_BLUE && cgs.redflag == FLAG_TAKEN) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $768
ADDRGP4 cgs+34808
INDIRI4
CNSTI4 1
NEI4 $768
line 994
;994:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $749
JUMPV
LABELV $768
line 995
;995:			} else {
line 996
;996:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $749
JUMPV
LABELV $750
line 1000
;997:			}
;998:		}
;999:	}
;1000:	return qfalse;
CNSTI4 0
RETI4
LABELV $749
endproc CG_YourTeamHasFlag 8 0
export CG_OwnerDrawVisible
proc CG_OwnerDrawVisible 4 0
line 1005
;1001:}
;1002:
;1003:// THINKABOUTME: should these be exclusive or inclusive.. 
;1004:// 
;1005:qboolean CG_OwnerDrawVisible(int flags) {
line 1007
;1006:
;1007:	if (flags & CG_SHOW_TEAMINFO) {
ADDRFP4 0
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $772
line 1008
;1008:		return (cg_currentSelectedPlayer.integer == numSortedTeamPlayers);
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
NEI4 $776
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $777
JUMPV
LABELV $776
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $777
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $771
JUMPV
LABELV $772
line 1011
;1009:	}
;1010:
;1011:	if (flags & CG_SHOW_NOTEAMINFO) {
ADDRFP4 0
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $778
line 1012
;1012:		return !(cg_currentSelectedPlayer.integer == numSortedTeamPlayers);
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
EQI4 $782
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $783
JUMPV
LABELV $782
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $783
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $771
JUMPV
LABELV $778
line 1015
;1013:	}
;1014:
;1015:	if (flags & CG_SHOW_OTHERTEAMHASFLAG) {
ADDRFP4 0
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $784
line 1016
;1016:		return CG_OtherTeamHasFlag();
ADDRLP4 0
ADDRGP4 CG_OtherTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $771
JUMPV
LABELV $784
line 1019
;1017:	}
;1018:
;1019:	if (flags & CG_SHOW_YOURTEAMHASENEMYFLAG) {
ADDRFP4 0
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
EQI4 $786
line 1020
;1020:		return CG_YourTeamHasFlag();
ADDRLP4 0
ADDRGP4 CG_YourTeamHasFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $771
JUMPV
LABELV $786
line 1023
;1021:	}
;1022:
;1023:	if (flags & (CG_SHOW_BLUE_TEAM_HAS_REDFLAG | CG_SHOW_RED_TEAM_HAS_BLUEFLAG)) {
ADDRFP4 0
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $788
line 1024
;1024:		if (flags & CG_SHOW_BLUE_TEAM_HAS_REDFLAG && (cgs.redflag == FLAG_TAKEN || cgs.flagStatus == FLAG_TAKEN_RED)) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
BANDI4
CNSTI4 0
EQI4 $790
ADDRGP4 cgs+34808
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $794
ADDRGP4 cgs+34816
INDIRI4
CNSTI4 2
NEI4 $790
LABELV $794
line 1025
;1025:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $790
line 1026
;1026:		} else if (flags & CG_SHOW_RED_TEAM_HAS_BLUEFLAG && (cgs.blueflag == FLAG_TAKEN || cgs.flagStatus == FLAG_TAKEN_BLUE)) {
ADDRFP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $795
ADDRGP4 cgs+34812
INDIRI4
CNSTI4 1
EQI4 $799
ADDRGP4 cgs+34816
INDIRI4
CNSTI4 3
NEI4 $795
LABELV $799
line 1027
;1027:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $795
line 1029
;1028:		}
;1029:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $771
JUMPV
LABELV $788
line 1032
;1030:	}
;1031:
;1032:	if (flags & CG_SHOW_ANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $800
line 1033
;1033:		if( cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
LTI4 $802
line 1034
;1034:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $802
line 1036
;1035:		}
;1036:	}
LABELV $800
line 1038
;1037:
;1038:	if (flags & CG_SHOW_ANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $805
line 1039
;1039:		if( cgs.gametype < GT_TEAM) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $807
line 1040
;1040:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $807
line 1042
;1041:		}
;1042:	}
LABELV $805
line 1044
;1043:
;1044:	if (flags & CG_SHOW_HARVESTER) {
ADDRFP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $810
line 1045
;1045:		if( cgs.gametype == GT_HARVESTER ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 7
NEI4 $812
line 1046
;1046:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $812
line 1047
;1047:    } else {
line 1048
;1048:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $771
JUMPV
LABELV $810
line 1052
;1049:    }
;1050:	}
;1051:
;1052:	if (flags & CG_SHOW_ONEFLAG) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $815
line 1053
;1053:		if( cgs.gametype == GT_1FCTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
NEI4 $817
line 1054
;1054:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $817
line 1055
;1055:    } else {
line 1056
;1056:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $771
JUMPV
LABELV $815
line 1060
;1057:    }
;1058:	}
;1059:
;1060:	if (flags & CG_SHOW_CTF) {
ADDRFP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $820
line 1061
;1061:		if( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $822
line 1062
;1062:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $822
line 1064
;1063:		}
;1064:	}
LABELV $820
line 1066
;1065:
;1066:	if (flags & CG_SHOW_OBELISK) {
ADDRFP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $825
line 1067
;1067:		if( cgs.gametype == GT_OBELISK ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 6
NEI4 $827
line 1068
;1068:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $827
line 1069
;1069:    } else {
line 1070
;1070:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $771
JUMPV
LABELV $825
line 1074
;1071:    }
;1072:	}
;1073:
;1074:	if (flags & CG_SHOW_HEALTHCRITICAL) {
ADDRFP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $830
line 1075
;1075:		if (cg.snap->ps.stats[STAT_HEALTH] < 25) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 25
GEI4 $832
line 1076
;1076:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $832
line 1078
;1077:		}
;1078:	}
LABELV $830
line 1080
;1079:
;1080:	if (flags & CG_SHOW_HEALTHOK) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $835
line 1081
;1081:		if (cg.snap->ps.stats[STAT_HEALTH] >= 25) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 25
LTI4 $837
line 1082
;1082:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $837
line 1084
;1083:		}
;1084:	}
LABELV $835
line 1086
;1085:
;1086:	if (flags & CG_SHOW_SINGLEPLAYER) {
ADDRFP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $840
line 1087
;1087:		if( cgs.gametype == GT_SINGLE_PLAYER ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 2
NEI4 $842
line 1088
;1088:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $842
line 1090
;1089:		}
;1090:	}
LABELV $840
line 1092
;1091:
;1092:	if (flags & CG_SHOW_TOURNAMENT) {
ADDRFP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $845
line 1093
;1093:		if( cgs.gametype == GT_TOURNAMENT ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 1
NEI4 $847
line 1094
;1094:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $847
line 1096
;1095:		}
;1096:	}
LABELV $845
line 1098
;1097:
;1098:	if (flags & CG_SHOW_DURINGINCOMINGVOICE) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $850
line 1099
;1099:	}
LABELV $850
line 1101
;1100:
;1101:	if (flags & CG_SHOW_IF_PLAYER_HAS_FLAG) {
ADDRFP4 0
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $852
line 1102
;1102:		if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $860
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $860
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $854
LABELV $860
line 1103
;1103:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $771
JUMPV
LABELV $854
line 1105
;1104:		}
;1105:	}
LABELV $852
line 1106
;1106:	return qfalse;
CNSTI4 0
RETI4
LABELV $771
endproc CG_OwnerDrawVisible 4 0
proc CG_DrawPlayerHasFlag 16 24
line 1111
;1107:}
;1108:
;1109:
;1110:
;1111:static void CG_DrawPlayerHasFlag(rectDef_t *rect, qboolean force2D) {
line 1112
;1112:	int adj = (force2D) ? 0 : 2;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $863
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $864
JUMPV
LABELV $863
ADDRLP4 4
CNSTI4 2
ASGNI4
LABELV $864
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1113
;1113:	if( cg.predictedPlayerState.powerups[PW_REDFLAG] ) {
ADDRGP4 cg+107636+312+28
INDIRI4
CNSTI4 0
EQI4 $865
line 1114
;1114:  	CG_DrawFlagModel( rect->x + adj, rect->y + adj, rect->w - adj, rect->h - adj, TEAM_RED, force2D);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
CNSTI4 1
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 1115
;1115:	} else if( cg.predictedPlayerState.powerups[PW_BLUEFLAG] ) {
ADDRGP4 $866
JUMPV
LABELV $865
ADDRGP4 cg+107636+312+32
INDIRI4
CNSTI4 0
EQI4 $870
line 1116
;1116:  	CG_DrawFlagModel( rect->x + adj, rect->y + adj, rect->w - adj, rect->h - adj, TEAM_BLUE, force2D);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
CNSTI4 2
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 1117
;1117:	} else if( cg.predictedPlayerState.powerups[PW_NEUTRALFLAG] ) {
ADDRGP4 $871
JUMPV
LABELV $870
ADDRGP4 cg+107636+312+36
INDIRI4
CNSTI4 0
EQI4 $875
line 1118
;1118:  	CG_DrawFlagModel( rect->x + adj, rect->y + adj, rect->w - adj, rect->h - adj, TEAM_FREE, force2D);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 1119
;1119:	}
LABELV $875
LABELV $871
LABELV $866
line 1120
;1120:}
LABELV $861
endproc CG_DrawPlayerHasFlag 16 24
proc CG_DrawAreaSystemChat 8 32
line 1122
;1121:
;1122:static void CG_DrawAreaSystemChat(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader) {
line 1123
;1123:  CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, systemChat, 0, 0, 0);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 systemChat
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1124
;1124:}
LABELV $880
endproc CG_DrawAreaSystemChat 8 32
proc CG_DrawAreaTeamChat 8 32
line 1126
;1125:
;1126:static void CG_DrawAreaTeamChat(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader) {
line 1127
;1127:  CG_Text_Paint(rect->x, rect->y + rect->h, scale, color,teamChat1, 0, 0, 0);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 teamChat1
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1128
;1128:}
LABELV $881
endproc CG_DrawAreaTeamChat 8 32
proc CG_DrawAreaChat 8 32
line 1130
;1129:
;1130:static void CG_DrawAreaChat(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader) {
line 1131
;1131:  CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, teamChat2, 0, 0, 0);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 teamChat2
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1132
;1132:}
LABELV $882
endproc CG_DrawAreaChat 8 32
export CG_GetKillerText
proc CG_GetKillerText 8 8
line 1134
;1133:
;1134:const char *CG_GetKillerText() {
line 1135
;1135:	const char *s = "";
ADDRLP4 0
ADDRGP4 $884
ASGNP4
line 1136
;1136:	if ( cg.killerName[0] ) {
ADDRGP4 cg+114332
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $885
line 1137
;1137:		s = va("Fragged by %s", cg.killerName );
ADDRGP4 $888
ARGP4
ADDRGP4 cg+114332
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1138
;1138:	}
LABELV $885
line 1139
;1139:	return s;
ADDRLP4 0
INDIRP4
RETP4
LABELV $883
endproc CG_GetKillerText 8 8
proc CG_DrawKiller 24 32
line 1143
;1140:}
;1141:
;1142:
;1143:static void CG_DrawKiller(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 1145
;1144:	// fragged by ... line
;1145:	if ( cg.killerName[0] ) {
ADDRGP4 cg+114332
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $891
line 1146
;1146:		int x = rect->x + rect->w / 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
CVFI4 4
ASGNI4
line 1147
;1147:	  CG_Text_Paint(x - CG_Text_Width(CG_GetKillerText(), scale, 0) / 2, rect->y + rect->h, scale, color, CG_GetKillerText(), 0, 0, textStyle);
ADDRLP4 8
ADDRGP4 CG_GetKillerText
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 16
ADDRGP4 CG_GetKillerText
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1148
;1148:	}
LABELV $891
line 1150
;1149:	
;1150:}
LABELV $890
endproc CG_DrawKiller 24 32
proc CG_DrawCapFragLimit 16 32
line 1153
;1151:
;1152:
;1153:static void CG_DrawCapFragLimit(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 1154
;1154:	int limit = (cgs.gametype >= GT_CTF) ? cgs.capturelimit : cgs.fraglimit;
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
LTI4 $899
ADDRLP4 4
ADDRGP4 cgs+31472
INDIRI4
ASGNI4
ADDRGP4 $900
JUMPV
LABELV $899
ADDRLP4 4
ADDRGP4 cgs+31468
INDIRI4
ASGNI4
LABELV $900
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1155
;1155:	CG_Text_Paint(rect->x, rect->y, scale, color, va("%2i", limit),0, 0, textStyle); 
ADDRGP4 $901
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1156
;1156:}
LABELV $894
endproc CG_DrawCapFragLimit 16 32
proc CG_Draw1stPlace 8 32
line 1158
;1157:
;1158:static void CG_Draw1stPlace(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 1159
;1159:	if (cgs.scores1 != SCORE_NOT_PRESENT) {
ADDRGP4 cgs+34800
INDIRI4
CNSTI4 -9999
EQI4 $903
line 1160
;1160:		CG_Text_Paint(rect->x, rect->y, scale, color, va("%2i", cgs.scores1),0, 0, textStyle); 
ADDRGP4 $901
ARGP4
ADDRGP4 cgs+34800
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1161
;1161:	}
LABELV $903
line 1162
;1162:}
LABELV $902
endproc CG_Draw1stPlace 8 32
proc CG_Draw2ndPlace 8 32
line 1164
;1163:
;1164:static void CG_Draw2ndPlace(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 1165
;1165:	if (cgs.scores2 != SCORE_NOT_PRESENT) {
ADDRGP4 cgs+34804
INDIRI4
CNSTI4 -9999
EQI4 $908
line 1166
;1166:		CG_Text_Paint(rect->x, rect->y, scale, color, va("%2i", cgs.scores2),0, 0, textStyle); 
ADDRGP4 $901
ARGP4
ADDRGP4 cgs+34804
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1167
;1167:	}
LABELV $908
line 1168
;1168:}
LABELV $907
endproc CG_Draw2ndPlace 8 32
export CG_GetGameStatusText
proc CG_GetGameStatusText 12 12
line 1170
;1169:
;1170:const char *CG_GetGameStatusText() {
line 1171
;1171:	const char *s = "";
ADDRLP4 0
ADDRGP4 $884
ASGNP4
line 1172
;1172:	if ( cgs.gametype < GT_TEAM) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $913
line 1173
;1173:		if (cg.snap->ps.persistant[PERS_TEAM] != TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
EQI4 $914
line 1174
;1174:			s = va("%s place with %i",CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),cg.snap->ps.persistant[PERS_SCORE] );
ADDRGP4 cg+36
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $919
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1175
;1175:		}
line 1176
;1176:	} else {
ADDRGP4 $914
JUMPV
LABELV $913
line 1177
;1177:		if ( cg.teamScores[0] == cg.teamScores[1] ) {
ADDRGP4 cg+110472
INDIRI4
ADDRGP4 cg+110472+4
INDIRI4
NEI4 $922
line 1178
;1178:			s = va("Teams are tied at %i", cg.teamScores[0] );
ADDRGP4 $927
ARGP4
ADDRGP4 cg+110472
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1179
;1179:		} else if ( cg.teamScores[0] >= cg.teamScores[1] ) {
ADDRGP4 $923
JUMPV
LABELV $922
ADDRGP4 cg+110472
INDIRI4
ADDRGP4 cg+110472+4
INDIRI4
LTI4 $929
line 1180
;1180:			s = va("Red leads Blue, %i to %i", cg.teamScores[0], cg.teamScores[1] );
ADDRGP4 $934
ARGP4
ADDRGP4 cg+110472
INDIRI4
ARGI4
ADDRGP4 cg+110472+4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1181
;1181:		} else {
ADDRGP4 $930
JUMPV
LABELV $929
line 1182
;1182:			s = va("Blue leads Red, %i to %i", cg.teamScores[1], cg.teamScores[0] );
ADDRGP4 $938
ARGP4
ADDRGP4 cg+110472+4
INDIRI4
ARGI4
ADDRGP4 cg+110472
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1183
;1183:		}
LABELV $930
LABELV $923
line 1184
;1184:	}
LABELV $914
line 1185
;1185:	return s;
ADDRLP4 0
INDIRP4
RETP4
LABELV $912
endproc CG_GetGameStatusText 12 12
proc CG_DrawGameStatus 8 32
line 1188
;1186:}
;1187:	
;1188:static void CG_DrawGameStatus(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 1189
;1189:	CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, CG_GetGameStatusText(), 0, 0, textStyle);
ADDRLP4 0
ADDRGP4 CG_GetGameStatusText
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1190
;1190:}
LABELV $942
endproc CG_DrawGameStatus 8 32
export CG_GameTypeString
proc CG_GameTypeString 0 0
line 1192
;1191:
;1192:const char *CG_GameTypeString() {
line 1193
;1193:	if ( cgs.gametype == GT_FFA ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 0
NEI4 $944
line 1194
;1194:		return "Free For All";
ADDRGP4 $947
RETP4
ADDRGP4 $943
JUMPV
LABELV $944
line 1195
;1195:	} else if ( cgs.gametype == GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
NEI4 $948
line 1196
;1196:		return "Team Deathmatch";
ADDRGP4 $951
RETP4
ADDRGP4 $943
JUMPV
LABELV $948
line 1197
;1197:	} else if ( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $952
line 1198
;1198:		return "Capture the Flag";
ADDRGP4 $955
RETP4
ADDRGP4 $943
JUMPV
LABELV $952
line 1199
;1199:	} else if ( cgs.gametype == GT_1FCTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 5
NEI4 $956
line 1200
;1200:		return "One Flag CTF";
ADDRGP4 $959
RETP4
ADDRGP4 $943
JUMPV
LABELV $956
line 1201
;1201:	} else if ( cgs.gametype == GT_OBELISK ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 6
NEI4 $960
line 1202
;1202:		return "Overload";
ADDRGP4 $963
RETP4
ADDRGP4 $943
JUMPV
LABELV $960
line 1203
;1203:	} else if ( cgs.gametype == GT_HARVESTER ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 7
NEI4 $964
line 1204
;1204:		return "Harvester";
ADDRGP4 $967
RETP4
ADDRGP4 $943
JUMPV
LABELV $964
line 1206
;1205:	}
;1206:	return "";
ADDRGP4 $884
RETP4
LABELV $943
endproc CG_GameTypeString 0 0
proc CG_DrawGameType 8 32
line 1208
;1207:}
;1208:static void CG_DrawGameType(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader, int textStyle ) {
line 1209
;1209:	CG_Text_Paint(rect->x, rect->y + rect->h, scale, color, CG_GameTypeString(), 0, 0, textStyle);
ADDRLP4 0
ADDRGP4 CG_GameTypeString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1210
;1210:}
LABELV $968
endproc CG_DrawGameType 8 32
proc CG_Text_Paint_Limit 76 40
line 1212
;1211:
;1212:static void CG_Text_Paint_Limit(float *maxX, float x, float y, float scale, vec4_t color, const char* text, float adjust, int limit) {
line 1216
;1213:  int len, count;
;1214:	vec4_t newColor;
;1215:	glyphInfo_t *glyph;
;1216:  if (text) {
ADDRFP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $970
line 1219
;1217:// TTimo: FIXME
;1218://    const unsigned char *s = text; // bk001206 - unsigned
;1219:    const char *s = text;
ADDRLP4 28
ADDRFP4 20
INDIRP4
ASGNP4
line 1220
;1220:		float max = *maxX;
ADDRLP4 40
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 1222
;1221:		float useScale;
;1222:		fontInfo_t *font = &cgDC.Assets.textFont;
ADDRLP4 36
ADDRGP4 cgDC+228+12
ASGNP4
line 1223
;1223:		if (scale <= cg_smallFont.value) {
ADDRFP4 12
INDIRF4
ADDRGP4 cg_smallFont+8
INDIRF4
GTF4 $974
line 1224
;1224:			font = &cgDC.Assets.smallFont;
ADDRLP4 36
ADDRGP4 cgDC+228+20560
ASGNP4
line 1225
;1225:		} else if (scale > cg_bigFont.value) {
ADDRGP4 $975
JUMPV
LABELV $974
ADDRFP4 12
INDIRF4
ADDRGP4 cg_bigFont+8
INDIRF4
LEF4 $979
line 1226
;1226:			font = &cgDC.Assets.bigFont;
ADDRLP4 36
ADDRGP4 cgDC+228+41108
ASGNP4
line 1227
;1227:		}
LABELV $979
LABELV $975
line 1228
;1228:		useScale = scale * font->glyphScale;
ADDRLP4 32
ADDRFP4 12
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 1229
;1229:		trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1230
;1230:    len = strlen(text);					 
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 1231
;1231:		if (limit > 0 && len > limit) {
ADDRLP4 48
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LEI4 $984
ADDRLP4 24
INDIRI4
ADDRLP4 48
INDIRI4
LEI4 $984
line 1232
;1232:			len = limit;
ADDRLP4 24
ADDRFP4 28
INDIRI4
ASGNI4
line 1233
;1233:		}
LABELV $984
line 1234
;1234:		count = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $987
JUMPV
LABELV $986
line 1235
;1235:		while (s && *s && count < len) {
line 1236
;1236:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 0
CNSTI4 80
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
line 1237
;1237:			if ( Q_IsColorString( s ) ) {
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $989
ADDRLP4 56
CNSTI4 94
ASGNI4
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 56
INDIRI4
NEI4 $989
ADDRLP4 60
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $989
ADDRLP4 60
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $989
line 1238
;1238:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
ADDRLP4 4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1239
;1239:				newColor[3] = color[3];
ADDRLP4 4+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1240
;1240:				trap_R_SetColor( newColor );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1241
;1241:				s += 2;
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 1242
;1242:				continue;
ADDRGP4 $987
JUMPV
LABELV $989
line 1243
;1243:			} else {
line 1244
;1244:	      float yadj = useScale * glyph->top;
ADDRLP4 64
ADDRLP4 32
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1245
;1245:				if (CG_Text_Width(s, useScale, 1) + x > max) {
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRF4
ADDF4
ADDRLP4 40
INDIRF4
LEF4 $992
line 1246
;1246:					*maxX = 0;
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 1247
;1247:					break;
ADDRGP4 $988
JUMPV
LABELV $992
line 1249
;1248:				}
;1249:		    CG_Text_PaintChar(x, y - yadj, 
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ADDRLP4 64
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Text_PaintChar
CALLV
pop
line 1258
;1250:			                    glyph->imageWidth,
;1251:				                  glyph->imageHeight,
;1252:					                useScale, 
;1253:						              glyph->s,
;1254:							            glyph->t,
;1255:								          glyph->s2,
;1256:									        glyph->t2,
;1257:										      glyph->glyph);
;1258:	      x += (glyph->xSkip * useScale) + adjust;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
MULF4
ADDRFP4 24
INDIRF4
ADDF4
ADDF4
ASGNF4
line 1259
;1259:				*maxX = x;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRF4
ASGNF4
line 1260
;1260:				count++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1261
;1261:				s++;
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1262
;1262:	    }
line 1263
;1263:		}
LABELV $987
line 1235
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $995
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $995
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $986
LABELV $995
LABELV $988
line 1264
;1264:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1265
;1265:  }
LABELV $970
line 1267
;1266:
;1267:}
LABELV $969
endproc CG_Text_Paint_Limit 76 40
export CG_DrawNewTeamInfo
proc CG_DrawNewTeamInfo 100 32
line 1273
;1268:
;1269:
;1270:
;1271:#define PIC_WIDTH 12
;1272:
;1273:void CG_DrawNewTeamInfo(rectDef_t *rect, float text_x, float text_y, float scale, vec4_t color, qhandle_t shader) {
line 1285
;1274:	int xx;
;1275:	float y;
;1276:	int i, j, len, count;
;1277:	const char *p;
;1278:	vec4_t		hcolor;
;1279:	float pwidth, lwidth, maxx, leftOver;
;1280:	clientInfo_t *ci;
;1281:	gitem_t	*item;
;1282:	qhandle_t h;
;1283:
;1284:	// max player name width
;1285:	pwidth = 0;
ADDRLP4 64
CNSTF4 0
ASGNF4
line 1286
;1286:	count = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
ADDRGP4 numSortedTeamPlayers
INDIRI4
CNSTI4 8
LEI4 $998
ADDRLP4 72
CNSTI4 8
ASGNI4
ADDRGP4 $999
JUMPV
LABELV $998
ADDRLP4 72
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
LABELV $999
ADDRLP4 32
ADDRLP4 72
INDIRI4
ASGNI4
line 1287
;1287:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1003
JUMPV
LABELV $1000
line 1288
;1288:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 1708
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1289
;1289:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1005
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
NEI4 $1005
line 1290
;1290:			len = CG_Text_Width( ci->name, scale, 0);
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 80
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 80
INDIRI4
ASGNI4
line 1291
;1291:			if (len > pwidth)
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRLP4 64
INDIRF4
LEF4 $1008
line 1292
;1292:				pwidth = len;
ADDRLP4 64
ADDRLP4 28
INDIRI4
CVIF4 4
ASGNF4
LABELV $1008
line 1293
;1293:		}
LABELV $1005
line 1294
;1294:	}
LABELV $1001
line 1287
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1003
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $1000
line 1297
;1295:
;1296:	// max location name width
;1297:	lwidth = 0;
ADDRLP4 68
CNSTF4 0
ASGNF4
line 1298
;1298:	for (i = 1; i < MAX_LOCATIONS; i++) {
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $1010
line 1299
;1299:		p = CG_ConfigString(CS_LOCATIONS + i);
ADDRLP4 8
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRLP4 76
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 76
INDIRP4
ASGNP4
line 1300
;1300:		if (p && *p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1014
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1014
line 1301
;1301:			len = CG_Text_Width(p, scale, 0);
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 84
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 84
INDIRI4
ASGNI4
line 1302
;1302:			if (len > lwidth)
ADDRLP4 28
INDIRI4
CVIF4 4
ADDRLP4 68
INDIRF4
LEF4 $1016
line 1303
;1303:				lwidth = len;
ADDRLP4 68
ADDRLP4 28
INDIRI4
CVIF4 4
ASGNF4
LABELV $1016
line 1304
;1304:		}
LABELV $1014
line 1305
;1305:	}
LABELV $1011
line 1298
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $1010
line 1307
;1306:
;1307:	y = rect->y;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1309
;1308:
;1309:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1021
JUMPV
LABELV $1018
line 1310
;1310:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
CNSTI4 1708
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 1311
;1311:		if ( ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1023
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
NEI4 $1023
line 1313
;1312:
;1313:			xx = rect->x + 1;
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1314
;1314:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1026
line 1315
;1315:				if (ci->powerups & (1 << j)) {
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1030
line 1317
;1316:
;1317:					item = BG_FindItemForPowerup( j );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 80
INDIRP4
ASGNP4
line 1319
;1318:
;1319:					if (item) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1032
line 1320
;1320:						CG_DrawPic( xx, y, PIC_WIDTH, PIC_WIDTH, trap_R_RegisterShader( item->icon ) );
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 1094713344
ASGNF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1321
;1321:						xx += PIC_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 1322
;1322:					}
LABELV $1032
line 1323
;1323:				}
LABELV $1030
line 1324
;1324:			}
LABELV $1027
line 1314
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LEI4 $1026
line 1327
;1325:
;1326:			// FIXME: max of 3 powerups shown properly
;1327:			xx = rect->x + (PIC_WIDTH * 3) + 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1108344832
ADDF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ASGNI4
line 1329
;1328:
;1329:			CG_GetColorForHealth( ci->health, ci->armor, hcolor );
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 1330
;1330:			trap_R_SetColor(hcolor);
ADDRLP4 48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1331
;1331:			CG_DrawPic( xx, y + 1, PIC_WIDTH - 2, PIC_WIDTH - 2, cgs.media.heartShader );
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRLP4 84
CNSTF4 1092616192
ASGNF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRGP4 cgs+152340+572
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1337
;1332:
;1333:			//Com_sprintf (st, sizeof(st), "%3i %3i", ci->health,	ci->armor);
;1334:			//CG_Text_Paint(xx, y + text_y, scale, hcolor, st, 0, 0); 
;1335:
;1336:			// draw weapon icon
;1337:			xx += PIC_WIDTH + 1;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
line 1348
;1338:
;1339:// weapon used is not that useful, use the space for task
;1340:#if 0
;1341:			if ( cg_weapons[ci->curWeapon].weaponIcon ) {
;1342:				CG_DrawPic( xx, y, PIC_WIDTH, PIC_WIDTH, cg_weapons[ci->curWeapon].weaponIcon );
;1343:			} else {
;1344:				CG_DrawPic( xx, y, PIC_WIDTH, PIC_WIDTH, cgs.media.deferShader );
;1345:			}
;1346:#endif
;1347:
;1348:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1349
;1349:			if (cgs.orderPending) {
ADDRGP4 cgs+152284
INDIRI4
CNSTI4 0
EQI4 $1036
line 1351
;1350:				// blink the icon
;1351:				if ( cg.time > cgs.orderTime - 2500 && (cg.time >> 9 ) & 1 ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+152288
INDIRI4
CNSTI4 2500
SUBI4
LEI4 $1039
ADDRGP4 cg+107604
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1039
line 1352
;1352:					h = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 1353
;1353:				} else {
ADDRGP4 $1037
JUMPV
LABELV $1039
line 1354
;1354:					h = CG_StatusHandle(cgs.currentOrder);
ADDRGP4 cgs+152280
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 88
INDIRI4
ASGNI4
line 1355
;1355:				}
line 1356
;1356:			}	else {
ADDRGP4 $1037
JUMPV
LABELV $1036
line 1357
;1357:				h = CG_StatusHandle(ci->teamTask);
ADDRLP4 4
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_StatusHandle
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 88
INDIRI4
ASGNI4
line 1358
;1358:			}
LABELV $1037
line 1360
;1359:
;1360:			if (h) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1045
line 1361
;1361:				CG_DrawPic( xx, y, PIC_WIDTH, PIC_WIDTH, h);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 88
CNSTF4 1094713344
ASGNF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 88
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1362
;1362:			}
LABELV $1045
line 1364
;1363:
;1364:			xx += PIC_WIDTH + 1;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
line 1366
;1365:
;1366:			leftOver = rect->w - xx;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1367
;1367:			maxx = xx + leftOver / 3;
ADDRLP4 36
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 40
INDIRF4
CNSTF4 1077936128
DIVF4
ADDF4
ASGNF4
line 1371
;1368:
;1369:
;1370:
;1371:			CG_Text_Paint_Limit(&maxx, xx, y + text_y, scale, color, ci->name, 0, 0); 
ADDRLP4 36
ARGP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_Text_Paint_Limit
CALLV
pop
line 1373
;1372:
;1373:			p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRLP4 88
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 88
INDIRP4
ASGNP4
line 1374
;1374:			if (!p || !*p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1049
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1047
LABELV $1049
line 1375
;1375:				p = "unknown";
ADDRLP4 20
ADDRGP4 $367
ASGNP4
line 1376
;1376:			}
LABELV $1047
line 1378
;1377:
;1378:			xx += leftOver / 3 + 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 40
INDIRF4
CNSTF4 1077936128
DIVF4
CNSTF4 1073741824
ADDF4
ADDF4
CVFI4 4
ASGNI4
line 1379
;1379:			maxx = rect->w - 4;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1082130432
SUBF4
ASGNF4
line 1381
;1380:
;1381:			CG_Text_Paint_Limit(&maxx, xx, y + text_y, scale, color, p, 0, 0); 
ADDRLP4 36
ARGP4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_Text_Paint_Limit
CALLV
pop
line 1382
;1382:			y += text_y + 2;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1073741824
ADDF4
ADDF4
ASGNF4
line 1383
;1383:			if ( y + text_y + 2 > rect->y + rect->h ) {
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
CNSTF4 1073741824
ADDF4
ADDRLP4 96
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
LEF4 $1050
line 1384
;1384:				break;
ADDRGP4 $1020
JUMPV
LABELV $1050
line 1387
;1385:			}
;1386:
;1387:		}
LABELV $1023
line 1388
;1388:	}
LABELV $1019
line 1309
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1021
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $1018
LABELV $1020
line 1389
;1389:}
LABELV $996
endproc CG_DrawNewTeamInfo 100 32
export CG_DrawTeamSpectators
proc CG_DrawTeamSpectators 24 32
line 1392
;1390:
;1391:
;1392:void CG_DrawTeamSpectators(rectDef_t *rect, float scale, vec4_t color, qhandle_t shader) {
line 1393
;1393:	if (cg.spectatorLen) {
ADDRGP4 cg+115388
INDIRI4
CNSTI4 0
EQI4 $1053
line 1396
;1394:		float maxX;
;1395:
;1396:		if (cg.spectatorWidth == -1) {
ADDRGP4 cg+115392
INDIRF4
CNSTF4 3212836864
NEF4 $1056
line 1397
;1397:			cg.spectatorWidth = 0;
ADDRGP4 cg+115392
CNSTF4 0
ASGNF4
line 1398
;1398:			cg.spectatorPaintX = rect->x + 1;
ADDRGP4 cg+115400
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1399
;1399:			cg.spectatorPaintX2 = -1;
ADDRGP4 cg+115404
CNSTI4 -1
ASGNI4
line 1400
;1400:		}
LABELV $1056
line 1402
;1401:
;1402:		if (cg.spectatorOffset > cg.spectatorLen) {
ADDRGP4 cg+115408
INDIRI4
ADDRGP4 cg+115388
INDIRI4
LEI4 $1062
line 1403
;1403:			cg.spectatorOffset = 0;
ADDRGP4 cg+115408
CNSTI4 0
ASGNI4
line 1404
;1404:			cg.spectatorPaintX = rect->x + 1;
ADDRGP4 cg+115400
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1405
;1405:			cg.spectatorPaintX2 = -1;
ADDRGP4 cg+115404
CNSTI4 -1
ASGNI4
line 1406
;1406:		}
LABELV $1062
line 1408
;1407:
;1408:		if (cg.time > cg.spectatorTime) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+115396
INDIRI4
LEI4 $1069
line 1409
;1409:			cg.spectatorTime = cg.time + 10;
ADDRGP4 cg+115396
ADDRGP4 cg+107604
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1410
;1410:			if (cg.spectatorPaintX <= rect->x + 2) {
ADDRGP4 cg+115400
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
GTF4 $1075
line 1411
;1411:				if (cg.spectatorOffset < cg.spectatorLen) {
ADDRGP4 cg+115408
INDIRI4
ADDRGP4 cg+115388
INDIRI4
GEI4 $1078
line 1412
;1412:					cg.spectatorPaintX += CG_Text_Width(&cg.spectatorList[cg.spectatorOffset], scale, 1) - 1;
ADDRGP4 cg+115408
INDIRI4
ADDRGP4 cg+114364
ADDP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 cg+115400
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
line 1413
;1413:					cg.spectatorOffset++;
ADDRLP4 12
ADDRGP4 cg+115408
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1414
;1414:				} else {
ADDRGP4 $1076
JUMPV
LABELV $1078
line 1415
;1415:					cg.spectatorOffset = 0;
ADDRGP4 cg+115408
CNSTI4 0
ASGNI4
line 1416
;1416:					if (cg.spectatorPaintX2 >= 0) {
ADDRGP4 cg+115404
INDIRI4
CNSTI4 0
LTI4 $1087
line 1417
;1417:						cg.spectatorPaintX = cg.spectatorPaintX2;
ADDRGP4 cg+115400
ADDRGP4 cg+115404
INDIRI4
ASGNI4
line 1418
;1418:					} else {
ADDRGP4 $1088
JUMPV
LABELV $1087
line 1419
;1419:						cg.spectatorPaintX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 cg+115400
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 1420
;1420:					}
LABELV $1088
line 1421
;1421:					cg.spectatorPaintX2 = -1;
ADDRGP4 cg+115404
CNSTI4 -1
ASGNI4
line 1422
;1422:				}
line 1423
;1423:			} else {
ADDRGP4 $1076
JUMPV
LABELV $1075
line 1424
;1424:				cg.spectatorPaintX--;
ADDRLP4 4
ADDRGP4 cg+115400
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1425
;1425:				if (cg.spectatorPaintX2 >= 0) {
ADDRGP4 cg+115404
INDIRI4
CNSTI4 0
LTI4 $1095
line 1426
;1426:					cg.spectatorPaintX2--;
ADDRLP4 8
ADDRGP4 cg+115404
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1427
;1427:				}
LABELV $1095
line 1428
;1428:			}
LABELV $1076
line 1429
;1429:		}
LABELV $1069
line 1431
;1430:
;1431:		maxX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1432
;1432:		CG_Text_Paint_Limit(&maxX, cg.spectatorPaintX, rect->y + rect->h - 3, scale, color, &cg.spectatorList[cg.spectatorOffset], 0, 0); 
ADDRLP4 0
ARGP4
ADDRGP4 cg+115400
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 cg+115408
INDIRI4
ADDRGP4 cg+114364
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_Text_Paint_Limit
CALLV
pop
line 1433
;1433:		if (cg.spectatorPaintX2 >= 0) {
ADDRGP4 cg+115404
INDIRI4
CNSTI4 0
LTI4 $1102
line 1434
;1434:			float maxX2 = rect->x + rect->w - 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1435
;1435:			CG_Text_Paint_Limit(&maxX2, cg.spectatorPaintX2, rect->y + rect->h - 3, scale, color, cg.spectatorList, 0, cg.spectatorOffset); 
ADDRLP4 12
ARGP4
ADDRGP4 cg+115404
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 cg+114364
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 cg+115408
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint_Limit
CALLV
pop
line 1436
;1436:		}
LABELV $1102
line 1437
;1437:		if (cg.spectatorOffset && maxX > 0) {
ADDRGP4 cg+115408
INDIRI4
CNSTI4 0
EQI4 $1108
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1108
line 1439
;1438:			// if we have an offset ( we are skipping the first part of the string ) and we fit the string
;1439:			if (cg.spectatorPaintX2 == -1) {
ADDRGP4 cg+115404
INDIRI4
CNSTI4 -1
NEI4 $1109
line 1440
;1440:						cg.spectatorPaintX2 = rect->x + rect->w - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 cg+115404
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 1441
;1441:			}
line 1442
;1442:		} else {
ADDRGP4 $1109
JUMPV
LABELV $1108
line 1443
;1443:			cg.spectatorPaintX2 = -1;
ADDRGP4 cg+115404
CNSTI4 -1
ASGNI4
line 1444
;1444:		}
LABELV $1109
line 1446
;1445:
;1446:	}
LABELV $1053
line 1447
;1447:}
LABELV $1052
endproc CG_DrawTeamSpectators 24 32
export CG_DrawMedal
proc CG_DrawMedal 32 32
line 1451
;1448:
;1449:
;1450:
;1451:void CG_DrawMedal(int ownerDraw, rectDef_t *rect, float scale, vec4_t color, qhandle_t shader) {
line 1452
;1452:	score_t *score = &cg.scores[cg.selectedScore];
ADDRLP4 8
CNSTI4 60
ADDRGP4 cg+110468
INDIRI4
MULI4
ADDRGP4 cg+110480
ADDP4
ASGNP4
line 1453
;1453:	float value = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1454
;1454:	char *text = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1455
;1455:	color[3] = 0.25;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1048576000
ASGNF4
line 1457
;1456:
;1457:	switch (ownerDraw) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 53
LTI4 $1119
ADDRLP4 12
INDIRI4
CNSTI4 59
GTI4 $1129
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1130-212
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1130
address $1121
address $1122
address $1123
address $1124
address $1125
address $1126
address $1127
code
LABELV $1129
ADDRFP4 0
INDIRI4
CNSTI4 69
EQI4 $1128
ADDRGP4 $1119
JUMPV
LABELV $1121
line 1459
;1458:		case CG_ACCURACY:
;1459:			value = score->accuracy;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1460
;1460:			break;
ADDRGP4 $1120
JUMPV
LABELV $1122
line 1462
;1461:		case CG_ASSISTS:
;1462:			value = score->assistCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1463
;1463:			break;
ADDRGP4 $1120
JUMPV
LABELV $1123
line 1465
;1464:		case CG_DEFEND:
;1465:			value = score->defendCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1466
;1466:			break;
ADDRGP4 $1120
JUMPV
LABELV $1124
line 1468
;1467:		case CG_EXCELLENT:
;1468:			value = score->excellentCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1469
;1469:			break;
ADDRGP4 $1120
JUMPV
LABELV $1125
line 1471
;1470:		case CG_IMPRESSIVE:
;1471:			value = score->impressiveCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1472
;1472:			break;
ADDRGP4 $1120
JUMPV
LABELV $1126
line 1474
;1473:		case CG_PERFECT:
;1474:			value = score->perfect;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1475
;1475:			break;
ADDRGP4 $1120
JUMPV
LABELV $1127
line 1477
;1476:		case CG_GAUNTLET:
;1477:			value = score->guantletCount;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1478
;1478:			break;
ADDRGP4 $1120
JUMPV
LABELV $1128
line 1480
;1479:		case CG_CAPTURES:
;1480:			value = score->captures;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1481
;1481:			break;
LABELV $1119
LABELV $1120
line 1484
;1482:	}
;1483:
;1484:	if (value > 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1132
line 1485
;1485:		if (ownerDraw != CG_PERFECT) {
ADDRFP4 0
INDIRI4
CNSTI4 58
EQI4 $1134
line 1486
;1486:			if (ownerDraw == CG_ACCURACY) {
ADDRFP4 0
INDIRI4
CNSTI4 53
NEI4 $1136
line 1487
;1487:				text = va("%i%%", (int)value);
ADDRGP4 $1138
ARGP4
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1488
;1488:				if (value > 50) {
ADDRLP4 0
INDIRF4
CNSTF4 1112014848
LEF4 $1135
line 1489
;1489:					color[3] = 1.0;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 1490
;1490:				}
line 1491
;1491:			} else {
ADDRGP4 $1135
JUMPV
LABELV $1136
line 1492
;1492:				text = va("%i", (int)value);
ADDRGP4 $203
ARGP4
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1493
;1493:				color[3] = 1.0;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 1494
;1494:			}
line 1495
;1495:		} else {
ADDRGP4 $1135
JUMPV
LABELV $1134
line 1496
;1496:			if (value) {
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1141
line 1497
;1497:				color[3] = 1.0;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 1498
;1498:			}
LABELV $1141
line 1499
;1499:			text = "Wow";
ADDRLP4 4
ADDRGP4 $1143
ASGNP4
line 1500
;1500:		}
LABELV $1135
line 1501
;1501:	}
LABELV $1132
line 1503
;1502:
;1503:	trap_R_SetColor(color);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1504
;1504:	CG_DrawPic( rect->x, rect->y, rect->w, rect->h, shader );
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1506
;1505:
;1506:	if (text) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1144
line 1507
;1507:		color[3] = 1.0;
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 1508
;1508:		value = CG_Text_Width(text, scale, 0);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 CG_Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
CVIF4 4
ASGNF4
line 1509
;1509:		CG_Text_Paint(rect->x + (rect->w - value) / 2, rect->y + rect->h + 10 , scale, color, text, 0, 0, 0);
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1092616192
ADDF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 CG_Text_Paint
CALLV
pop
line 1510
;1510:	}
LABELV $1144
line 1511
;1511:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1513
;1512:
;1513:}
LABELV $1116
endproc CG_DrawMedal 32 32
export CG_OwnerDraw
proc CG_OwnerDraw 20 24
line 1517
;1514:
;1515:	
;1516://
;1517:void CG_OwnerDraw(float x, float y, float w, float h, float text_x, float text_y, int ownerDraw, int ownerDrawFlags, int align, float special, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 1520
;1518:	rectDef_t rect;
;1519:
;1520:  if ( cg_drawStatus.integer == 0 ) {
ADDRGP4 cg_drawStatus+12
INDIRI4
CNSTI4 0
NEI4 $1147
line 1521
;1521:		return;
ADDRGP4 $1146
JUMPV
LABELV $1147
line 1528
;1522:	}
;1523:
;1524:	//if (ownerDrawFlags != 0 && !CG_OwnerDrawVisible(ownerDrawFlags)) {
;1525:	//	return;
;1526:	//}
;1527:
;1528:  rect.x = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
line 1529
;1529:  rect.y = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
ASGNF4
line 1530
;1530:  rect.w = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
ASGNF4
line 1531
;1531:  rect.h = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 1533
;1532:
;1533:  switch (ownerDraw) {
ADDRLP4 16
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $1154
ADDRLP4 16
INDIRI4
CNSTI4 69
GTI4 $1154
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1210-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1210
address $1155
address $1157
address $1171
address $1174
address $1158
address $1160
address $1161
address $1167
address $1168
address $1164
address $1169
address $1170
address $1154
address $1154
address $1154
address $1154
address $1154
address $1154
address $1172
address $1173
address $1179
address $1180
address $1181
address $1182
address $1183
address $1184
address $1176
address $1175
address $1177
address $1178
address $1185
address $1187
address $1188
address $1189
address $1190
address $1191
address $1154
address $1193
address $1198
address $1165
address $1166
address $1192
address $1154
address $1154
address $1154
address $1195
address $1196
address $1197
address $1199
address $1200
address $1156
address $1159
address $1201
address $1201
address $1201
address $1201
address $1201
address $1201
address $1201
address $1202
address $1203
address $1162
address $1163
address $1194
address $1186
address $1207
address $1208
address $1209
address $1201
code
LABELV $1155
line 1535
;1534:  case CG_PLAYER_ARMOR_ICON:
;1535:    CG_DrawPlayerArmorIcon(&rect, ownerDrawFlags & CG_SHOW_2DONLY);
ADDRLP4 0
ARGP4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
ADDRGP4 CG_DrawPlayerArmorIcon
CALLV
pop
line 1536
;1536:    break;
ADDRGP4 $1154
JUMPV
LABELV $1156
line 1538
;1537:  case CG_PLAYER_ARMOR_ICON2D:
;1538:    CG_DrawPlayerArmorIcon(&rect, qtrue);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawPlayerArmorIcon
CALLV
pop
line 1539
;1539:    break;
ADDRGP4 $1154
JUMPV
LABELV $1157
line 1541
;1540:  case CG_PLAYER_ARMOR_VALUE:
;1541:    CG_DrawPlayerArmorValue(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerArmorValue
CALLV
pop
line 1542
;1542:    break;
ADDRGP4 $1154
JUMPV
LABELV $1158
line 1544
;1543:  case CG_PLAYER_AMMO_ICON:
;1544:    CG_DrawPlayerAmmoIcon(&rect, ownerDrawFlags & CG_SHOW_2DONLY);
ADDRLP4 0
ARGP4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
ADDRGP4 CG_DrawPlayerAmmoIcon
CALLV
pop
line 1545
;1545:    break;
ADDRGP4 $1154
JUMPV
LABELV $1159
line 1547
;1546:  case CG_PLAYER_AMMO_ICON2D:
;1547:    CG_DrawPlayerAmmoIcon(&rect, qtrue);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawPlayerAmmoIcon
CALLV
pop
line 1548
;1548:    break;
ADDRGP4 $1154
JUMPV
LABELV $1160
line 1550
;1549:  case CG_PLAYER_AMMO_VALUE:
;1550:    CG_DrawPlayerAmmoValue(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerAmmoValue
CALLV
pop
line 1551
;1551:    break;
ADDRGP4 $1154
JUMPV
LABELV $1161
line 1553
;1552:  case CG_SELECTEDPLAYER_HEAD:
;1553:    CG_DrawSelectedPlayerHead(&rect, ownerDrawFlags & CG_SHOW_2DONLY, qfalse);
ADDRLP4 0
ARGP4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawSelectedPlayerHead
CALLV
pop
line 1554
;1554:    break;
ADDRGP4 $1154
JUMPV
LABELV $1162
line 1556
;1555:  case CG_VOICE_HEAD:
;1556:    CG_DrawSelectedPlayerHead(&rect, ownerDrawFlags & CG_SHOW_2DONLY, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawSelectedPlayerHead
CALLV
pop
line 1557
;1557:    break;
ADDRGP4 $1154
JUMPV
LABELV $1163
line 1559
;1558:  case CG_VOICE_NAME:
;1559:    CG_DrawSelectedPlayerName(&rect, scale, color, qtrue, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawSelectedPlayerName
CALLV
pop
line 1560
;1560:    break;
ADDRGP4 $1154
JUMPV
LABELV $1164
line 1562
;1561:  case CG_SELECTEDPLAYER_STATUS:
;1562:    CG_DrawSelectedPlayerStatus(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawSelectedPlayerStatus
CALLV
pop
line 1563
;1563:    break;
ADDRGP4 $1154
JUMPV
LABELV $1165
line 1565
;1564:  case CG_SELECTEDPLAYER_ARMOR:
;1565:    CG_DrawSelectedPlayerArmor(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawSelectedPlayerArmor
CALLV
pop
line 1566
;1566:    break;
ADDRGP4 $1154
JUMPV
LABELV $1166
line 1568
;1567:  case CG_SELECTEDPLAYER_HEALTH:
;1568:    CG_DrawSelectedPlayerHealth(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawSelectedPlayerHealth
CALLV
pop
line 1569
;1569:    break;
ADDRGP4 $1154
JUMPV
LABELV $1167
line 1571
;1570:  case CG_SELECTEDPLAYER_NAME:
;1571:    CG_DrawSelectedPlayerName(&rect, scale, color, qfalse, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawSelectedPlayerName
CALLV
pop
line 1572
;1572:    break;
ADDRGP4 $1154
JUMPV
LABELV $1168
line 1574
;1573:  case CG_SELECTEDPLAYER_LOCATION:
;1574:    CG_DrawSelectedPlayerLocation(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawSelectedPlayerLocation
CALLV
pop
line 1575
;1575:    break;
ADDRGP4 $1154
JUMPV
LABELV $1169
line 1577
;1576:  case CG_SELECTEDPLAYER_WEAPON:
;1577:    CG_DrawSelectedPlayerWeapon(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawSelectedPlayerWeapon
CALLV
pop
line 1578
;1578:    break;
ADDRGP4 $1154
JUMPV
LABELV $1170
line 1580
;1579:  case CG_SELECTEDPLAYER_POWERUP:
;1580:    CG_DrawSelectedPlayerPowerup(&rect, ownerDrawFlags & CG_SHOW_2DONLY);
ADDRLP4 0
ARGP4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
ADDRGP4 CG_DrawSelectedPlayerPowerup
CALLV
pop
line 1581
;1581:    break;
ADDRGP4 $1154
JUMPV
LABELV $1171
line 1583
;1582:  case CG_PLAYER_HEAD:
;1583:    CG_DrawPlayerHead(&rect, ownerDrawFlags & CG_SHOW_2DONLY);
ADDRLP4 0
ARGP4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
ADDRGP4 CG_DrawPlayerHead
CALLV
pop
line 1584
;1584:    break;
ADDRGP4 $1154
JUMPV
LABELV $1172
line 1586
;1585:  case CG_PLAYER_ITEM:
;1586:    CG_DrawPlayerItem(&rect, scale, ownerDrawFlags & CG_SHOW_2DONLY);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 28
INDIRI4
CNSTI4 268435456
BANDI4
ARGI4
ADDRGP4 CG_DrawPlayerItem
CALLV
pop
line 1587
;1587:    break;
ADDRGP4 $1154
JUMPV
LABELV $1173
line 1589
;1588:  case CG_PLAYER_SCORE:
;1589:    CG_DrawPlayerScore(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerScore
CALLV
pop
line 1590
;1590:    break;
ADDRGP4 $1154
JUMPV
LABELV $1174
line 1592
;1591:  case CG_PLAYER_HEALTH:
;1592:    CG_DrawPlayerHealth(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerHealth
CALLV
pop
line 1593
;1593:    break;
ADDRGP4 $1154
JUMPV
LABELV $1175
line 1595
;1594:  case CG_RED_SCORE:
;1595:    CG_DrawRedScore(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawRedScore
CALLV
pop
line 1596
;1596:    break;
ADDRGP4 $1154
JUMPV
LABELV $1176
line 1598
;1597:  case CG_BLUE_SCORE:
;1598:    CG_DrawBlueScore(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawBlueScore
CALLV
pop
line 1599
;1599:    break;
ADDRGP4 $1154
JUMPV
LABELV $1177
line 1601
;1600:  case CG_RED_NAME:
;1601:    CG_DrawRedName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawRedName
CALLV
pop
line 1602
;1602:    break;
ADDRGP4 $1154
JUMPV
LABELV $1178
line 1604
;1603:  case CG_BLUE_NAME:
;1604:    CG_DrawBlueName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawBlueName
CALLV
pop
line 1605
;1605:    break;
ADDRGP4 $1154
JUMPV
LABELV $1179
line 1607
;1606:  case CG_BLUE_FLAGHEAD:
;1607:    CG_DrawBlueFlagHead(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawBlueFlagHead
CALLV
pop
line 1608
;1608:    break;
ADDRGP4 $1154
JUMPV
LABELV $1180
line 1610
;1609:  case CG_BLUE_FLAGSTATUS:
;1610:    CG_DrawBlueFlagStatus(&rect, shader);
ADDRLP4 0
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawBlueFlagStatus
CALLV
pop
line 1611
;1611:    break;
ADDRGP4 $1154
JUMPV
LABELV $1181
line 1613
;1612:  case CG_BLUE_FLAGNAME:
;1613:    CG_DrawBlueFlagName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawBlueFlagName
CALLV
pop
line 1614
;1614:    break;
ADDRGP4 $1154
JUMPV
LABELV $1182
line 1616
;1615:  case CG_RED_FLAGHEAD:
;1616:    CG_DrawRedFlagHead(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawRedFlagHead
CALLV
pop
line 1617
;1617:    break;
ADDRGP4 $1154
JUMPV
LABELV $1183
line 1619
;1618:  case CG_RED_FLAGSTATUS:
;1619:    CG_DrawRedFlagStatus(&rect, shader);
ADDRLP4 0
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawRedFlagStatus
CALLV
pop
line 1620
;1620:    break;
ADDRGP4 $1154
JUMPV
LABELV $1184
line 1622
;1621:  case CG_RED_FLAGNAME:
;1622:    CG_DrawRedFlagName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawRedFlagName
CALLV
pop
line 1623
;1623:    break;
ADDRGP4 $1154
JUMPV
LABELV $1185
line 1625
;1624:  case CG_HARVESTER_SKULLS:
;1625:    CG_HarvesterSkulls(&rect, scale, color, qfalse, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_HarvesterSkulls
CALLV
pop
line 1626
;1626:    break;
ADDRGP4 $1154
JUMPV
LABELV $1186
line 1628
;1627:  case CG_HARVESTER_SKULLS2D:
;1628:    CG_HarvesterSkulls(&rect, scale, color, qtrue, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_HarvesterSkulls
CALLV
pop
line 1629
;1629:    break;
ADDRGP4 $1154
JUMPV
LABELV $1187
line 1631
;1630:  case CG_ONEFLAG_STATUS:
;1631:    CG_OneFlagStatus(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_OneFlagStatus
CALLV
pop
line 1632
;1632:    break;
ADDRGP4 $1154
JUMPV
LABELV $1188
line 1634
;1633:  case CG_PLAYER_LOCATION:
;1634:    CG_DrawPlayerLocation(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawPlayerLocation
CALLV
pop
line 1635
;1635:    break;
ADDRGP4 $1154
JUMPV
LABELV $1189
line 1637
;1636:  case CG_TEAM_COLOR:
;1637:    CG_DrawTeamColor(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 CG_DrawTeamColor
CALLV
pop
line 1638
;1638:    break;
ADDRGP4 $1154
JUMPV
LABELV $1190
line 1640
;1639:  case CG_CTF_POWERUP:
;1640:    CG_DrawCTFPowerUp(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawCTFPowerUp
CALLV
pop
line 1641
;1641:    break;
ADDRGP4 $1154
JUMPV
LABELV $1191
line 1643
;1642:  case CG_AREA_POWERUP:
;1643:		CG_DrawAreaPowerUp(&rect, align, special, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 32
INDIRI4
ARGI4
ADDRFP4 36
INDIRF4
ARGF4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 CG_DrawAreaPowerUp
CALLV
pop
line 1644
;1644:    break;
ADDRGP4 $1154
JUMPV
LABELV $1192
line 1646
;1645:  case CG_PLAYER_STATUS:
;1646:    CG_DrawPlayerStatus(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 CG_DrawPlayerStatus
CALLV
pop
line 1647
;1647:    break;
ADDRGP4 $1154
JUMPV
LABELV $1193
line 1649
;1648:  case CG_PLAYER_HASFLAG:
;1649:    CG_DrawPlayerHasFlag(&rect, qfalse);
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawPlayerHasFlag
CALLV
pop
line 1650
;1650:    break;
ADDRGP4 $1154
JUMPV
LABELV $1194
line 1652
;1651:  case CG_PLAYER_HASFLAG2D:
;1652:    CG_DrawPlayerHasFlag(&rect, qtrue);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawPlayerHasFlag
CALLV
pop
line 1653
;1653:    break;
ADDRGP4 $1154
JUMPV
LABELV $1195
line 1655
;1654:  case CG_AREA_SYSTEMCHAT:
;1655:    CG_DrawAreaSystemChat(&rect, scale, color, shader);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawAreaSystemChat
CALLV
pop
line 1656
;1656:    break;
ADDRGP4 $1154
JUMPV
LABELV $1196
line 1658
;1657:  case CG_AREA_TEAMCHAT:
;1658:    CG_DrawAreaTeamChat(&rect, scale, color, shader);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawAreaTeamChat
CALLV
pop
line 1659
;1659:    break;
ADDRGP4 $1154
JUMPV
LABELV $1197
line 1661
;1660:  case CG_AREA_CHAT:
;1661:    CG_DrawAreaChat(&rect, scale, color, shader);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawAreaChat
CALLV
pop
line 1662
;1662:    break;
ADDRGP4 $1154
JUMPV
LABELV $1198
line 1664
;1663:  case CG_GAME_TYPE:
;1664:    CG_DrawGameType(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawGameType
CALLV
pop
line 1665
;1665:    break;
ADDRGP4 $1154
JUMPV
LABELV $1199
line 1667
;1666:  case CG_GAME_STATUS:
;1667:    CG_DrawGameStatus(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawGameStatus
CALLV
pop
line 1668
;1668:		break;
ADDRGP4 $1154
JUMPV
LABELV $1200
line 1670
;1669:  case CG_KILLER:
;1670:    CG_DrawKiller(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawKiller
CALLV
pop
line 1671
;1671:		break;
ADDRGP4 $1154
JUMPV
LABELV $1201
line 1680
;1672:	case CG_ACCURACY:
;1673:	case CG_ASSISTS:
;1674:	case CG_DEFEND:
;1675:	case CG_EXCELLENT:
;1676:	case CG_IMPRESSIVE:
;1677:	case CG_PERFECT:
;1678:	case CG_GAUNTLET:
;1679:	case CG_CAPTURES:
;1680:		CG_DrawMedal(ownerDraw, &rect, scale, color, shader);
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawMedal
CALLV
pop
line 1681
;1681:		break;
ADDRGP4 $1154
JUMPV
LABELV $1202
line 1683
;1682:  case CG_SPECTATORS:
;1683:		CG_DrawTeamSpectators(&rect, scale, color, shader);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawTeamSpectators
CALLV
pop
line 1684
;1684:		break;
ADDRGP4 $1154
JUMPV
LABELV $1203
line 1686
;1685:  case CG_TEAMINFO:
;1686:		if (cg_currentSelectedPlayer.integer == numSortedTeamPlayers) {
ADDRGP4 cg_currentSelectedPlayer+12
INDIRI4
ADDRGP4 numSortedTeamPlayers
INDIRI4
NEI4 $1154
line 1687
;1687:			CG_DrawNewTeamInfo(&rect, text_x, text_y, scale, color, shader);
ADDRLP4 0
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawNewTeamInfo
CALLV
pop
line 1688
;1688:		}
line 1689
;1689:		break;
ADDRGP4 $1154
JUMPV
LABELV $1207
line 1691
;1690:  case CG_CAPFRAGLIMIT:
;1691:    CG_DrawCapFragLimit(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_DrawCapFragLimit
CALLV
pop
line 1692
;1692:		break;
ADDRGP4 $1154
JUMPV
LABELV $1208
line 1694
;1693:  case CG_1STPLACE:
;1694:    CG_Draw1stPlace(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_Draw1stPlace
CALLV
pop
line 1695
;1695:		break;
ADDRGP4 $1154
JUMPV
LABELV $1209
line 1697
;1696:  case CG_2NDPLACE:
;1697:    CG_Draw2ndPlace(&rect, scale, color, shader, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 CG_Draw2ndPlace
CALLV
pop
line 1698
;1698:		break;
line 1700
;1699:  default:
;1700:    break;
LABELV $1154
line 1702
;1701:  }
;1702:}
LABELV $1146
endproc CG_OwnerDraw 20 24
export CG_MouseEvent
proc CG_MouseEvent 16 12
line 1704
;1703:
;1704:void CG_MouseEvent(int x, int y) {
line 1707
;1705:	int n;
;1706:
;1707:	if ( (cg.predictedPlayerState.pm_type == PM_NORMAL || cg.predictedPlayerState.pm_type == PM_SPECTATOR) && cg.showScores == qfalse) {
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 0
EQI4 $1220
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 2
NEI4 $1213
LABELV $1220
ADDRGP4 cg+114320
INDIRI4
CNSTI4 0
NEI4 $1213
line 1708
;1708:    trap_Key_SetCatcher(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 1709
;1709:		return;
ADDRGP4 $1212
JUMPV
LABELV $1213
line 1712
;1710:	}
;1711:
;1712:	cgs.cursorX+= x;
ADDRLP4 4
ADDRGP4 cgs+152252
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 1713
;1713:	if (cgs.cursorX < 0)
ADDRGP4 cgs+152252
INDIRI4
CNSTI4 0
GEI4 $1222
line 1714
;1714:		cgs.cursorX = 0;
ADDRGP4 cgs+152252
CNSTI4 0
ASGNI4
ADDRGP4 $1223
JUMPV
LABELV $1222
line 1715
;1715:	else if (cgs.cursorX > 640)
ADDRGP4 cgs+152252
INDIRI4
CNSTI4 640
LEI4 $1226
line 1716
;1716:		cgs.cursorX = 640;
ADDRGP4 cgs+152252
CNSTI4 640
ASGNI4
LABELV $1226
LABELV $1223
line 1718
;1717:
;1718:	cgs.cursorY += y;
ADDRLP4 8
ADDRGP4 cgs+152256
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1719
;1719:	if (cgs.cursorY < 0)
ADDRGP4 cgs+152256
INDIRI4
CNSTI4 0
GEI4 $1231
line 1720
;1720:		cgs.cursorY = 0;
ADDRGP4 cgs+152256
CNSTI4 0
ASGNI4
ADDRGP4 $1232
JUMPV
LABELV $1231
line 1721
;1721:	else if (cgs.cursorY > 480)
ADDRGP4 cgs+152256
INDIRI4
CNSTI4 480
LEI4 $1235
line 1722
;1722:		cgs.cursorY = 480;
ADDRGP4 cgs+152256
CNSTI4 480
ASGNI4
LABELV $1235
LABELV $1232
line 1724
;1723:
;1724:	n = Display_CursorType(cgs.cursorX, cgs.cursorY);
ADDRGP4 cgs+152252
INDIRI4
ARGI4
ADDRGP4 cgs+152256
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Display_CursorType
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1725
;1725:	cgs.activeCursor = 0;
ADDRGP4 cgs+152276
CNSTI4 0
ASGNI4
line 1726
;1726:	if (n == CURSOR_ARROW) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $1242
line 1727
;1727:		cgs.activeCursor = cgs.media.selectCursor;
ADDRGP4 cgs+152276
ADDRGP4 cgs+152340+1224
INDIRI4
ASGNI4
line 1728
;1728:	} else if (n == CURSOR_SIZER) {
ADDRGP4 $1243
JUMPV
LABELV $1242
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1247
line 1729
;1729:		cgs.activeCursor = cgs.media.sizeCursor;
ADDRGP4 cgs+152276
ADDRGP4 cgs+152340+1228
INDIRI4
ASGNI4
line 1730
;1730:	}
LABELV $1247
LABELV $1243
line 1732
;1731:
;1732:  if (cgs.capturedItem) {
ADDRGP4 cgs+152272
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1252
line 1733
;1733:	  Display_MouseMove(cgs.capturedItem, x, y);
ADDRGP4 cgs+152272
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 1734
;1734:  } else {
ADDRGP4 $1253
JUMPV
LABELV $1252
line 1735
;1735:	  Display_MouseMove(NULL, cgs.cursorX, cgs.cursorY);
CNSTP4 0
ARGP4
ADDRGP4 cgs+152252
INDIRI4
ARGI4
ADDRGP4 cgs+152256
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 1736
;1736:  }
LABELV $1253
line 1738
;1737:
;1738:}
LABELV $1212
endproc CG_MouseEvent 16 12
export CG_HideTeamMenu
proc CG_HideTeamMenu 0 4
line 1746
;1739:
;1740:/*
;1741:==================
;1742:CG_HideTeamMenus
;1743:==================
;1744:
;1745:*/
;1746:void CG_HideTeamMenu() {
line 1747
;1747:  Menus_CloseByName("teamMenu");
ADDRGP4 $1259
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 1748
;1748:  Menus_CloseByName("getMenu");
ADDRGP4 $1260
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 1749
;1749:}
LABELV $1258
endproc CG_HideTeamMenu 0 4
export CG_ShowTeamMenu
proc CG_ShowTeamMenu 0 4
line 1757
;1750:
;1751:/*
;1752:==================
;1753:CG_ShowTeamMenus
;1754:==================
;1755:
;1756:*/
;1757:void CG_ShowTeamMenu() {
line 1758
;1758:  Menus_OpenByName("teamMenu");
ADDRGP4 $1259
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 1759
;1759:}
LABELV $1261
endproc CG_ShowTeamMenu 0 4
export CG_EventHandling
proc CG_EventHandling 0 0
line 1773
;1760:
;1761:
;1762:
;1763:
;1764:/*
;1765:==================
;1766:CG_EventHandling
;1767:==================
;1768: type 0 - no event handling
;1769:      1 - team menu
;1770:      2 - hud editor
;1771:
;1772:*/
;1773:void CG_EventHandling(int type) {
line 1774
;1774:	cgs.eventHandling = type;
ADDRGP4 cgs+152260
ADDRFP4 0
INDIRI4
ASGNI4
line 1775
;1775:  if (type == CGAME_EVENT_NONE) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $1264
line 1776
;1776:    CG_HideTeamMenu();
ADDRGP4 CG_HideTeamMenu
CALLV
pop
line 1777
;1777:  } else if (type == CGAME_EVENT_TEAMMENU) {
ADDRGP4 $1265
JUMPV
LABELV $1264
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $1266
line 1779
;1778:    //CG_ShowTeamMenu();
;1779:  } else if (type == CGAME_EVENT_SCOREBOARD) {
ADDRGP4 $1267
JUMPV
LABELV $1266
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $1268
line 1780
;1780:  }
LABELV $1268
LABELV $1267
LABELV $1265
line 1782
;1781:
;1782:}
LABELV $1262
endproc CG_EventHandling 0 0
export CG_KeyEvent
proc CG_KeyEvent 8 16
line 1786
;1783:
;1784:
;1785:
;1786:void CG_KeyEvent(int key, qboolean down) {
line 1788
;1787:
;1788:	if (!down) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1271
line 1789
;1789:		return;
ADDRGP4 $1270
JUMPV
LABELV $1271
line 1792
;1790:	}
;1791:
;1792:	if ( cg.predictedPlayerState.pm_type == PM_NORMAL || (cg.predictedPlayerState.pm_type == PM_SPECTATOR && cg.showScores == qfalse)) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 cg+107636+4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1280
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 2
NEI4 $1273
ADDRGP4 cg+114320
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1273
LABELV $1280
line 1793
;1793:		CG_EventHandling(CGAME_EVENT_NONE);
CNSTI4 0
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 1794
;1794:    trap_Key_SetCatcher(0);
CNSTI4 0
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 1795
;1795:		return;
ADDRGP4 $1270
JUMPV
LABELV $1273
line 1806
;1796:	}
;1797:
;1798:  //if (key == trap_Key_GetKey("teamMenu") || !Display_CaptureItem(cgs.cursorX, cgs.cursorY)) {
;1799:    // if we see this then we should always be visible
;1800:  //  CG_EventHandling(CGAME_EVENT_NONE);
;1801:  //  trap_Key_SetCatcher(0);
;1802:  //}
;1803:
;1804:
;1805:
;1806:  Display_HandleKey(key, down, cgs.cursorX, cgs.cursorY);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+152252
INDIRI4
ARGI4
ADDRGP4 cgs+152256
INDIRI4
ARGI4
ADDRGP4 Display_HandleKey
CALLV
pop
line 1808
;1807:
;1808:	if (cgs.capturedItem) {
ADDRGP4 cgs+152272
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1283
line 1809
;1809:		cgs.capturedItem = NULL;
ADDRGP4 cgs+152272
CNSTP4 0
ASGNP4
line 1810
;1810:	}	else {
ADDRGP4 $1284
JUMPV
LABELV $1283
line 1811
;1811:		if (key == K_MOUSE2 && down) {
ADDRFP4 0
INDIRI4
CNSTI4 179
NEI4 $1287
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1287
line 1812
;1812:			cgs.capturedItem = Display_CaptureItem(cgs.cursorX, cgs.cursorY);
ADDRGP4 cgs+152252
INDIRI4
ARGI4
ADDRGP4 cgs+152256
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Display_CaptureItem
CALLP4
ASGNP4
ADDRGP4 cgs+152272
ADDRLP4 4
INDIRP4
ASGNP4
line 1813
;1813:		}
LABELV $1287
line 1814
;1814:	}
LABELV $1284
line 1815
;1815:}
LABELV $1270
endproc CG_KeyEvent 8 16
export CG_ClientNumFromName
proc CG_ClientNumFromName 12 8
line 1817
;1816:
;1817:int CG_ClientNumFromName(const char *p) {
line 1819
;1818:  int i;
;1819:  for (i = 0; i < cgs.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1296
JUMPV
LABELV $1293
line 1820
;1820:    if (cgs.clientinfo[i].infoValid && Q_stricmp(cgs.clientinfo[i].name, p) == 0) {
ADDRLP4 4
CNSTI4 1708
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1298
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+40972+4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1298
line 1821
;1821:      return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1292
JUMPV
LABELV $1298
line 1823
;1822:    }
;1823:  }
LABELV $1294
line 1819
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1296
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+31480
INDIRI4
LTI4 $1293
line 1824
;1824:  return -1;
CNSTI4 -1
RETI4
LABELV $1292
endproc CG_ClientNumFromName 12 8
export CG_ShowResponseHead
proc CG_ShowResponseHead 0 8
line 1827
;1825:}
;1826:
;1827:void CG_ShowResponseHead() {
line 1828
;1828:  Menus_OpenByName("voiceMenu");
ADDRGP4 $1304
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 1829
;1829:	trap_Cvar_Set("cl_conXOffset", "72");
ADDRGP4 $1305
ARGP4
ADDRGP4 $1306
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1830
;1830:	cg.voiceTime = cg.time;
ADDRGP4 cg+124420
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1831
;1831:}
LABELV $1303
endproc CG_ShowResponseHead 0 8
export CG_RunMenuScript
proc CG_RunMenuScript 0 0
line 1833
;1832:
;1833:void CG_RunMenuScript(char **args) {
line 1834
;1834:}
LABELV $1309
endproc CG_RunMenuScript 0 0
export CG_GetTeamColor
proc CG_GetTeamColor 8 0
line 1837
;1835:
;1836:
;1837:void CG_GetTeamColor(vec4_t *color) {
line 1838
;1838:  if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1311
line 1839
;1839:    (*color)[0] = 1.0f;
ADDRFP4 0
INDIRP4
CNSTF4 1065353216
ASGNF4
line 1840
;1840:    (*color)[3] = 0.25f;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1048576000
ASGNF4
line 1841
;1841:    (*color)[1] = (*color)[2] = 0.0f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1842
;1842:  } else if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
ADDRGP4 $1312
JUMPV
LABELV $1311
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1314
line 1843
;1843:    (*color)[0] = (*color)[1] = 0.0f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1844
;1844:    (*color)[2] = 1.0f;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 1845
;1845:    (*color)[3] = 0.25f;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1048576000
ASGNF4
line 1846
;1846:  } else {
ADDRGP4 $1315
JUMPV
LABELV $1314
line 1847
;1847:    (*color)[0] = (*color)[2] = 0.0f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1848
;1848:    (*color)[1] = 0.17f;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1043207291
ASGNF4
line 1849
;1849:    (*color)[3] = 0.25f;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1048576000
ASGNF4
line 1850
;1850:	}
LABELV $1315
LABELV $1312
line 1851
;1851:}
LABELV $1310
endproc CG_GetTeamColor 8 0
import cgDC
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_LightningBoltBeam
import CG_InvulnerabilityJuiced
import CG_InvulnerabilityImpact
import CG_ObeliskPain
import CG_ObeliskExplode
import CG_KamikazeEffect
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_BuildSpectatorString
import CG_GetSelectedScore
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_obeliskRespawnDelay
import cg_recordSPDemoName
import cg_recordSPDemo
import cg_singlePlayerActive
import cg_enableBreath
import cg_enableDust
import cg_singlePlayer
import cg_currentSelectedPlayerName
import cg_currentSelectedPlayer
import cg_blueTeamName
import cg_redTeamName
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $1306
byte 1 55
byte 1 50
byte 1 0
align 1
LABELV $1305
byte 1 99
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 88
byte 1 79
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1304
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1260
byte 1 103
byte 1 101
byte 1 116
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1259
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $1143
byte 1 87
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $1138
byte 1 37
byte 1 105
byte 1 37
byte 1 37
byte 1 0
align 1
LABELV $967
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $963
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $959
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $955
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $951
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $947
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $938
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $934
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $927
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $919
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $901
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $888
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $884
byte 1 0
align 1
LABELV $458
byte 1 45
byte 1 0
align 1
LABELV $367
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $203
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $151
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $148
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $147
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $146
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $132
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $128
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $117
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $116
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $114
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $113
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $111
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $110
byte 1 111
byte 1 110
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $108
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 49
byte 1 48
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $107
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $106
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $104
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 57
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 57
byte 1 0
align 1
LABELV $103
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $102
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $100
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 56
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 56
byte 1 0
align 1
LABELV $99
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $98
byte 1 111
byte 1 110
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $96
byte 1 43
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 55
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 59
byte 1 32
byte 1 45
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 55
byte 1 0
align 1
LABELV $95
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $94
byte 1 111
byte 1 110
byte 1 111
byte 1 102
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 0
