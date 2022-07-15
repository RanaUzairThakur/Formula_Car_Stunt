Shader "CM/Diffuse Double Sided" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		LOD 150
		Tags { "RenderType" = "Opaque" }
		Pass {
			Name "FORWARD"
			LOD 150
			Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			Cull Off
			GpuProgramID 2809
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying mediump vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying mediump vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying mediump vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD3.xyz = u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _ShadowMapTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					bool u_xlatb3;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb3 = vs_TEXCOORD5.z<u_xlat3.x;
					    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
					    u_xlat3.x = max(u_xlat3.x, _LightShadowData.x);
					    u_xlat16_2.x = (-u_xlat3.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x + u_xlat3.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _ShadowMapTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					bool u_xlatb3;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb3 = vs_TEXCOORD5.z<u_xlat3.x;
					    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
					    u_xlat3.x = max(u_xlat3.x, _LightShadowData.x);
					    u_xlat16_2.x = (-u_xlat3.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x + u_xlat3.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _ShadowMapTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					bool u_xlatb3;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb3 = vs_TEXCOORD5.z<u_xlat3.x;
					    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
					    u_xlat3.x = max(u_xlat3.x, _LightShadowData.x);
					    u_xlat16_2.x = (-u_xlat3.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x + u_xlat3.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_5;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat3.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_5 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_5 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_5;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat3.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_5 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_5 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_5;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat3.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_5 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_5 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat16_3 = u_xlat1.y * u_xlat1.y;
					    u_xlat16_3 = u_xlat1.x * u_xlat1.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
					    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _ShadowMapTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					bool u_xlatb4;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb4 = vs_TEXCOORD5.z<u_xlat4.x;
					    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat4.x = max(u_xlat4.x, _LightShadowData.x);
					    u_xlat16_2.x = (-u_xlat4.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x + u_xlat4.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_0.xyz;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + u_xlat16_3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat16_3 = u_xlat1.y * u_xlat1.y;
					    u_xlat16_3 = u_xlat1.x * u_xlat1.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
					    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _ShadowMapTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					bool u_xlatb4;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb4 = vs_TEXCOORD5.z<u_xlat4.x;
					    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat4.x = max(u_xlat4.x, _LightShadowData.x);
					    u_xlat16_2.x = (-u_xlat4.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x + u_xlat4.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_0.xyz;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + u_xlat16_3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat16_3 = u_xlat1.y * u_xlat1.y;
					    u_xlat16_3 = u_xlat1.x * u_xlat1.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
					    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _ShadowMapTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					bool u_xlatb4;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb4 = vs_TEXCOORD5.z<u_xlat4.x;
					    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat4.x = max(u_xlat4.x, _LightShadowData.x);
					    u_xlat16_2.x = (-u_xlat4.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x + u_xlat4.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_0.xyz;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + u_xlat16_3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump float u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
					    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
					    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in mediump vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					mediump float u_xlat16_6;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
					    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat4.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_6 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_6 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + u_xlat16_3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump float u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
					    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
					    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in mediump vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					mediump float u_xlat16_6;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
					    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat4.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_6 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_6 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + u_xlat16_3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump float u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
					    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
					    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in mediump vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					mediump float u_xlat16_6;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
					    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat4.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_6 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_6 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + u_xlat16_3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					float u_xlat21;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
					    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
					    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
					    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
					    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
					    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_5.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying mediump vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					float u_xlat21;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
					    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
					    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
					    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
					    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
					    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_5.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying mediump vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					float u_xlat21;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
					    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
					    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
					    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
					    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
					    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_5.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying mediump vec3 vs_TEXCOORD3;
					#define SV_Target0 gl_FragData[0]
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat10_1.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					float u_xlat21;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
					    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
					    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
					    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
					    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
					    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_5.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					float u_xlat21;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
					    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
					    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
					    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
					    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
					    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_5.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					float u_xlat21;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
					    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
					    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
					    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
					    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
					    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
					    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_5.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _ShadowMapTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					bool u_xlatb3;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb3 = vs_TEXCOORD5.z<u_xlat3.x;
					    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
					    u_xlat3.x = max(u_xlat3.x, _LightShadowData.x);
					    u_xlat16_2.x = (-u_xlat3.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x + u_xlat3.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _ShadowMapTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					bool u_xlatb3;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb3 = vs_TEXCOORD5.z<u_xlat3.x;
					    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
					    u_xlat3.x = max(u_xlat3.x, _LightShadowData.x);
					    u_xlat16_2.x = (-u_xlat3.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x + u_xlat3.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _ShadowMapTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					bool u_xlatb3;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb3 = vs_TEXCOORD5.z<u_xlat3.x;
					    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
					    u_xlat3.x = max(u_xlat3.x, _LightShadowData.x);
					    u_xlat16_2.x = (-u_xlat3.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x + u_xlat3.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_5;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat3.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_5 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_5 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_5;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat3.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_5 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_5 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_5;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat3.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_5 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_5 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					mediump vec3 u_xlat16_6;
					mediump vec3 u_xlat16_7;
					float u_xlat25;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat25 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat25 = inversesqrt(u_xlat25);
					    u_xlat1.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz;
					    u_xlat3 = (-u_xlat2.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat2.yyyy) + unity_4LightPosY0;
					    u_xlat2 = (-u_xlat2.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat1.yyyy * u_xlat4;
					    u_xlat4 = u_xlat4 * u_xlat4;
					    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat1.xxxx + u_xlat5;
					    u_xlat3 = u_xlat2 * u_xlat1.zzzz + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat2 + u_xlat4;
					    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = inversesqrt(u_xlat2);
					    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat3.xyz = u_xlat2.yyy * unity_LightColor[1].xyz;
					    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[2].xyz * u_xlat2.zzz + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[3].xyz * u_xlat2.www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat16_6.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_6.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_6.x);
					    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_7.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_7.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_7.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_6.xyz = unity_SHC.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat16_6.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _ShadowMapTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					bool u_xlatb4;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb4 = vs_TEXCOORD5.z<u_xlat4.x;
					    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat4.x = max(u_xlat4.x, _LightShadowData.x);
					    u_xlat16_2.x = (-u_xlat4.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x + u_xlat4.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_0.xyz;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + u_xlat16_3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					mediump vec3 u_xlat16_6;
					mediump vec3 u_xlat16_7;
					float u_xlat25;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat25 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat25 = inversesqrt(u_xlat25);
					    u_xlat1.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz;
					    u_xlat3 = (-u_xlat2.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat2.yyyy) + unity_4LightPosY0;
					    u_xlat2 = (-u_xlat2.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat1.yyyy * u_xlat4;
					    u_xlat4 = u_xlat4 * u_xlat4;
					    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat1.xxxx + u_xlat5;
					    u_xlat3 = u_xlat2 * u_xlat1.zzzz + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat2 + u_xlat4;
					    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = inversesqrt(u_xlat2);
					    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat3.xyz = u_xlat2.yyy * unity_LightColor[1].xyz;
					    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[2].xyz * u_xlat2.zzz + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[3].xyz * u_xlat2.www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat16_6.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_6.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_6.x);
					    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_7.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_7.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_7.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_6.xyz = unity_SHC.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat16_6.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _ShadowMapTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					bool u_xlatb4;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb4 = vs_TEXCOORD5.z<u_xlat4.x;
					    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat4.x = max(u_xlat4.x, _LightShadowData.x);
					    u_xlat16_2.x = (-u_xlat4.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x + u_xlat4.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_0.xyz;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + u_xlat16_3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					varying highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					mediump vec3 u_xlat16_6;
					mediump vec3 u_xlat16_7;
					float u_xlat25;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat25 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat25 = inversesqrt(u_xlat25);
					    u_xlat1.xyz = vec3(u_xlat25) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.w = 0.0;
					    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz;
					    u_xlat3 = (-u_xlat2.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat2.yyyy) + unity_4LightPosY0;
					    u_xlat2 = (-u_xlat2.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat1.yyyy * u_xlat4;
					    u_xlat4 = u_xlat4 * u_xlat4;
					    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat1.xxxx + u_xlat5;
					    u_xlat3 = u_xlat2 * u_xlat1.zzzz + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat2 + u_xlat4;
					    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = inversesqrt(u_xlat2);
					    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat3.xyz = u_xlat2.yyy * unity_LightColor[1].xyz;
					    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[2].xyz * u_xlat2.zzz + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[3].xyz * u_xlat2.www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat16_6.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_6.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_6.x);
					    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_7.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_7.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_7.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_6.xyz = unity_SHC.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat16_6.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					uniform lowp sampler2D _MainTex;
					uniform highp sampler2D _ShadowMapTexture;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying mediump vec3 vs_TEXCOORD3;
					varying highp vec4 vs_TEXCOORD5;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					bool u_xlatb4;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = texture2D(_ShadowMapTexture, vs_TEXCOORD5.xy).x;
					    u_xlatb4 = vs_TEXCOORD5.z<u_xlat4.x;
					    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
					    u_xlat4.x = max(u_xlat4.x, _LightShadowData.x);
					    u_xlat16_2.x = (-u_xlat4.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x + u_xlat4.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_0.xyz;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + u_xlat16_3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					float u_xlat21;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
					    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
					    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_5.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in mediump vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					mediump float u_xlat16_6;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
					    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat4.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_6 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_6 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + u_xlat16_3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					float u_xlat21;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
					    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
					    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_5.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in mediump vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					mediump float u_xlat16_6;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
					    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat4.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_6 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_6 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + u_xlat16_3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					float u_xlat21;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
					    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat0);
					    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
					    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_5.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in mediump vec3 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					vec3 u_xlat4;
					mediump float u_xlat16_6;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
					    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat4.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_6 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_6 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_3.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + u_xlat16_3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					int u_xlati5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat5.xyz;
					    u_xlat16_3 = u_xlat5.y * u_xlat5.y;
					    u_xlat16_3 = u_xlat5.x * u_xlat5.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
					    vs_TEXCOORD3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	int unity_BaseInstanceID;
					uniform 	mediump vec4 _LightColor0;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD3;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlati0 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_3.xyz = _LightColor0.xyz * unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.www;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_14) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					int u_xlati5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat5.xyz;
					    u_xlat16_3 = u_xlat5.y * u_xlat5.y;
					    u_xlat16_3 = u_xlat5.x * u_xlat5.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
					    vs_TEXCOORD3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	int unity_BaseInstanceID;
					uniform 	mediump vec4 _LightColor0;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD3;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlati0 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_3.xyz = _LightColor0.xyz * unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.www;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_14) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					int u_xlati5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat5.xyz;
					    u_xlat16_3 = u_xlat5.y * u_xlat5.y;
					    u_xlat16_3 = u_xlat5.x * u_xlat5.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
					    vs_TEXCOORD3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	int unity_BaseInstanceID;
					uniform 	mediump vec4 _LightColor0;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD3;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlati0 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_3.xyz = _LightColor0.xyz * unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.www;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_14) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_5;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat3.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_5 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_5 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_5;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat3.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_5 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_5 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_5;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat3.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_5 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_5 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					int u_xlati5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat5.xyz;
					    u_xlat16_3 = u_xlat5.y * u_xlat5.y;
					    u_xlat16_3 = u_xlat5.x * u_xlat5.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
					    vs_TEXCOORD3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	mediump vec4 _LightColor0;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in mediump vec3 vs_TEXCOORD3;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_5;
					vec3 u_xlat6;
					float u_xlat12;
					mediump float u_xlat16_20;
					void main()
					{
					    u_xlati0 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat6.xyz = log2(u_xlat16_2.xyz);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat6.xyz = exp2(u_xlat6.xyz);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat6.xyz * u_xlat16_1.xyz;
					    u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat6.x = (-u_xlat12) + u_xlat6.x;
					    u_xlat6.x = unity_ShadowFadeCenterAndType.w * u_xlat6.x + u_xlat12;
					    u_xlat6.x = u_xlat6.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_20 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_20 = u_xlat12 * u_xlat16_20 + _LightShadowData.x;
					    u_xlat16_5.x = (-u_xlat16_20) + unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.w;
					    u_xlat16_20 = u_xlat6.x * u_xlat16_5.x + u_xlat16_20;
					    u_xlat16_5.xyz = vec3(u_xlat16_20) * _LightColor0.xyz;
					    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
					    u_xlat16_20 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_20 = max(u_xlat16_20, 0.0);
					    SV_Target0.xyz = u_xlat16_5.xyz * vec3(u_xlat16_20) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					int u_xlati5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat5.xyz;
					    u_xlat16_3 = u_xlat5.y * u_xlat5.y;
					    u_xlat16_3 = u_xlat5.x * u_xlat5.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
					    vs_TEXCOORD3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	mediump vec4 _LightColor0;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in mediump vec3 vs_TEXCOORD3;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_5;
					vec3 u_xlat6;
					float u_xlat12;
					mediump float u_xlat16_20;
					void main()
					{
					    u_xlati0 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat6.xyz = log2(u_xlat16_2.xyz);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat6.xyz = exp2(u_xlat6.xyz);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat6.xyz * u_xlat16_1.xyz;
					    u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat6.x = (-u_xlat12) + u_xlat6.x;
					    u_xlat6.x = unity_ShadowFadeCenterAndType.w * u_xlat6.x + u_xlat12;
					    u_xlat6.x = u_xlat6.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_20 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_20 = u_xlat12 * u_xlat16_20 + _LightShadowData.x;
					    u_xlat16_5.x = (-u_xlat16_20) + unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.w;
					    u_xlat16_20 = u_xlat6.x * u_xlat16_5.x + u_xlat16_20;
					    u_xlat16_5.xyz = vec3(u_xlat16_20) * _LightColor0.xyz;
					    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
					    u_xlat16_20 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_20 = max(u_xlat16_20, 0.0);
					    SV_Target0.xyz = u_xlat16_5.xyz * vec3(u_xlat16_20) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					int u_xlati5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat5.xyz;
					    u_xlat16_3 = u_xlat5.y * u_xlat5.y;
					    u_xlat16_3 = u_xlat5.x * u_xlat5.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
					    vs_TEXCOORD3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	mediump vec4 _LightColor0;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in mediump vec3 vs_TEXCOORD3;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_5;
					vec3 u_xlat6;
					float u_xlat12;
					mediump float u_xlat16_20;
					void main()
					{
					    u_xlati0 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat6.xyz = log2(u_xlat16_2.xyz);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat6.xyz = exp2(u_xlat6.xyz);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat6.xyz * u_xlat16_1.xyz;
					    u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat6.x = (-u_xlat12) + u_xlat6.x;
					    u_xlat6.x = unity_ShadowFadeCenterAndType.w * u_xlat6.x + u_xlat12;
					    u_xlat6.x = u_xlat6.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_20 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_20 = u_xlat12 * u_xlat16_20 + _LightShadowData.x;
					    u_xlat16_5.x = (-u_xlat16_20) + unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.w;
					    u_xlat16_20 = u_xlat6.x * u_xlat16_5.x + u_xlat16_20;
					    u_xlat16_5.xyz = vec3(u_xlat16_20) * _LightColor0.xyz;
					    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
					    u_xlat16_20 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_20 = max(u_xlat16_20, 0.0);
					    SV_Target0.xyz = u_xlat16_5.xyz * vec3(u_xlat16_20) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump float u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat16_0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_0 = max(u_xlat16_0, 0.0);
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_1.xyz * _LightColor0.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					vec4 u_xlat5;
					mediump vec3 u_xlat16_5;
					vec3 u_xlat6;
					int u_xlati6;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati6 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    u_xlat1.xyz = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat6.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat6.x = inversesqrt(u_xlat6.x);
					    u_xlat6.xyz = u_xlat6.xxx * u_xlat2.xyz;
					    vs_TEXCOORD1.xyz = u_xlat6.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat16_4.x = u_xlat6.y * u_xlat6.y;
					    u_xlat16_4.x = u_xlat6.x * u_xlat6.x + (-u_xlat16_4.x);
					    u_xlat16_2 = u_xlat6.yzzx * u_xlat6.xyzz;
					    u_xlat16_5.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
					    u_xlat16_5.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
					    u_xlat16_5.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
					    u_xlat16_4.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat6.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat5 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat5 * u_xlat6.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat6.zzzz + u_xlat3;
					    u_xlat2 = u_xlat5 * u_xlat5 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_4.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	int unity_BaseInstanceID;
					uniform 	mediump vec4 _LightColor0;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD3;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlati0 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_3.xyz = _LightColor0.xyz * unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.www;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_14) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					vec4 u_xlat5;
					mediump vec3 u_xlat16_5;
					vec3 u_xlat6;
					int u_xlati6;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati6 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    u_xlat1.xyz = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat6.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat6.x = inversesqrt(u_xlat6.x);
					    u_xlat6.xyz = u_xlat6.xxx * u_xlat2.xyz;
					    vs_TEXCOORD1.xyz = u_xlat6.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat16_4.x = u_xlat6.y * u_xlat6.y;
					    u_xlat16_4.x = u_xlat6.x * u_xlat6.x + (-u_xlat16_4.x);
					    u_xlat16_2 = u_xlat6.yzzx * u_xlat6.xyzz;
					    u_xlat16_5.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
					    u_xlat16_5.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
					    u_xlat16_5.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
					    u_xlat16_4.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat6.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat5 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat5 * u_xlat6.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat6.zzzz + u_xlat3;
					    u_xlat2 = u_xlat5 * u_xlat5 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_4.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	int unity_BaseInstanceID;
					uniform 	mediump vec4 _LightColor0;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD3;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlati0 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_3.xyz = _LightColor0.xyz * unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.www;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_14) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					vec4 u_xlat5;
					mediump vec3 u_xlat16_5;
					vec3 u_xlat6;
					int u_xlati6;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati6 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    u_xlat1.xyz = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat6.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat6.x = inversesqrt(u_xlat6.x);
					    u_xlat6.xyz = u_xlat6.xxx * u_xlat2.xyz;
					    vs_TEXCOORD1.xyz = u_xlat6.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat16_4.x = u_xlat6.y * u_xlat6.y;
					    u_xlat16_4.x = u_xlat6.x * u_xlat6.x + (-u_xlat16_4.x);
					    u_xlat16_2 = u_xlat6.yzzx * u_xlat6.xyzz;
					    u_xlat16_5.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
					    u_xlat16_5.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
					    u_xlat16_5.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
					    u_xlat16_4.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat6.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat5 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat5 * u_xlat6.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat6.zzzz + u_xlat3;
					    u_xlat2 = u_xlat5 * u_xlat5 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_4.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	int unity_BaseInstanceID;
					uniform 	mediump vec4 _LightColor0;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD3;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump float u_xlat16_14;
					void main()
					{
					    u_xlati0 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_3.xyz = _LightColor0.xyz * unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.www;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz;
					    u_xlat16_14 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_14 = max(u_xlat16_14, 0.0);
					    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_14) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_5;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat3.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_5 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_5 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_5;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat3.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_5 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_5 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	mediump vec4 _LightColor0;
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_5;
					mediump float u_xlat16_11;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat3.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
					    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_2.x = (-_LightShadowData.x) + 1.0;
					    u_xlat16_2.x = u_xlat3.x * u_xlat16_2.x + _LightShadowData.x;
					    u_xlat16_5 = (-u_xlat16_2.x) + 1.0;
					    u_xlat16_2.x = u_xlat0.x * u_xlat16_5 + u_xlat16_2.x;
					    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
					    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_11 = max(u_xlat16_11, 0.0);
					    SV_Target0.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					vec4 u_xlat5;
					mediump vec3 u_xlat16_5;
					vec3 u_xlat6;
					int u_xlati6;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati6 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    u_xlat1.xyz = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat6.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat6.x = inversesqrt(u_xlat6.x);
					    u_xlat6.xyz = u_xlat6.xxx * u_xlat2.xyz;
					    vs_TEXCOORD1.xyz = u_xlat6.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat16_4.x = u_xlat6.y * u_xlat6.y;
					    u_xlat16_4.x = u_xlat6.x * u_xlat6.x + (-u_xlat16_4.x);
					    u_xlat16_2 = u_xlat6.yzzx * u_xlat6.xyzz;
					    u_xlat16_5.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
					    u_xlat16_5.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
					    u_xlat16_5.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
					    u_xlat16_4.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat6.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat5 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat5 * u_xlat6.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat6.zzzz + u_xlat3;
					    u_xlat2 = u_xlat5 * u_xlat5 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_4.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	mediump vec4 _LightColor0;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in mediump vec3 vs_TEXCOORD3;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_5;
					vec3 u_xlat6;
					float u_xlat12;
					mediump float u_xlat16_20;
					void main()
					{
					    u_xlati0 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat6.xyz = log2(u_xlat16_2.xyz);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat6.xyz = exp2(u_xlat6.xyz);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat6.xyz * u_xlat16_1.xyz;
					    u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat6.x = (-u_xlat12) + u_xlat6.x;
					    u_xlat6.x = unity_ShadowFadeCenterAndType.w * u_xlat6.x + u_xlat12;
					    u_xlat6.x = u_xlat6.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_20 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_20 = u_xlat12 * u_xlat16_20 + _LightShadowData.x;
					    u_xlat16_5.x = (-u_xlat16_20) + unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.w;
					    u_xlat16_20 = u_xlat6.x * u_xlat16_5.x + u_xlat16_20;
					    u_xlat16_5.xyz = vec3(u_xlat16_20) * _LightColor0.xyz;
					    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
					    u_xlat16_20 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_20 = max(u_xlat16_20, 0.0);
					    SV_Target0.xyz = u_xlat16_5.xyz * vec3(u_xlat16_20) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					vec4 u_xlat5;
					mediump vec3 u_xlat16_5;
					vec3 u_xlat6;
					int u_xlati6;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati6 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    u_xlat1.xyz = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat6.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat6.x = inversesqrt(u_xlat6.x);
					    u_xlat6.xyz = u_xlat6.xxx * u_xlat2.xyz;
					    vs_TEXCOORD1.xyz = u_xlat6.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat16_4.x = u_xlat6.y * u_xlat6.y;
					    u_xlat16_4.x = u_xlat6.x * u_xlat6.x + (-u_xlat16_4.x);
					    u_xlat16_2 = u_xlat6.yzzx * u_xlat6.xyzz;
					    u_xlat16_5.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
					    u_xlat16_5.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
					    u_xlat16_5.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
					    u_xlat16_4.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat6.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat5 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat5 * u_xlat6.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat6.zzzz + u_xlat3;
					    u_xlat2 = u_xlat5 * u_xlat5 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_4.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	mediump vec4 _LightColor0;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in mediump vec3 vs_TEXCOORD3;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_5;
					vec3 u_xlat6;
					float u_xlat12;
					mediump float u_xlat16_20;
					void main()
					{
					    u_xlati0 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat6.xyz = log2(u_xlat16_2.xyz);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat6.xyz = exp2(u_xlat6.xyz);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat6.xyz * u_xlat16_1.xyz;
					    u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat6.x = (-u_xlat12) + u_xlat6.x;
					    u_xlat6.x = unity_ShadowFadeCenterAndType.w * u_xlat6.x + u_xlat12;
					    u_xlat6.x = u_xlat6.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_20 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_20 = u_xlat12 * u_xlat16_20 + _LightShadowData.x;
					    u_xlat16_5.x = (-u_xlat16_20) + unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.w;
					    u_xlat16_20 = u_xlat6.x * u_xlat16_5.x + u_xlat16_20;
					    u_xlat16_5.xyz = vec3(u_xlat16_20) * _LightColor0.xyz;
					    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
					    u_xlat16_20 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_20 = max(u_xlat16_20, 0.0);
					    SV_Target0.xyz = u_xlat16_5.xyz * vec3(u_xlat16_20) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 unity_4LightPosX0;
					uniform 	vec4 unity_4LightPosY0;
					uniform 	vec4 unity_4LightPosZ0;
					uniform 	mediump vec4 unity_4LightAtten0;
					uniform 	mediump vec4 unity_LightColor[8];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out mediump vec3 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD5;
					out highp vec4 vs_TEXCOORD6;
					flat out highp uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					vec4 u_xlat3;
					mediump vec3 u_xlat16_4;
					vec4 u_xlat5;
					mediump vec3 u_xlat16_5;
					vec3 u_xlat6;
					int u_xlati6;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati6 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    u_xlat1.xyz = unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
					    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati6 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat6.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat6.x = inversesqrt(u_xlat6.x);
					    u_xlat6.xyz = u_xlat6.xxx * u_xlat2.xyz;
					    vs_TEXCOORD1.xyz = u_xlat6.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat16_4.x = u_xlat6.y * u_xlat6.y;
					    u_xlat16_4.x = u_xlat6.x * u_xlat6.x + (-u_xlat16_4.x);
					    u_xlat16_2 = u_xlat6.yzzx * u_xlat6.xyzz;
					    u_xlat16_5.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
					    u_xlat16_5.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
					    u_xlat16_5.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
					    u_xlat16_4.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
					    u_xlat2 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat3 = u_xlat6.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat5 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat3 = u_xlat5 * u_xlat6.xxxx + u_xlat3;
					    u_xlat0 = u_xlat1 * u_xlat6.zzzz + u_xlat3;
					    u_xlat2 = u_xlat5 * u_xlat5 + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat2;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat2 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat0 = u_xlat0 * u_xlat2;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat1 * u_xlat0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_4.xyz;
					    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifdef GL_EXT_shader_texture_lod
					#extension GL_EXT_shader_texture_lod : enable
					#endif
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
					uniform 	mediump vec4 _LightShadowData;
					uniform 	vec4 unity_ShadowFadeCenterAndType;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	mediump vec4 _LightColor0;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform highp sampler2D _ShadowMapTexture;
					UNITY_LOCATION(2) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in mediump vec3 vs_TEXCOORD3;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_5;
					vec3 u_xlat6;
					float u_xlat12;
					mediump float u_xlat16_20;
					void main()
					{
					    u_xlati0 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat6.xyz = log2(u_xlat16_2.xyz);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat6.xyz = exp2(u_xlat6.xyz);
					    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat6.xyz * u_xlat16_1.xyz;
					    u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
					    u_xlat6.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
					    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
					    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat6.x = (-u_xlat12) + u_xlat6.x;
					    u_xlat6.x = unity_ShadowFadeCenterAndType.w * u_xlat6.x + u_xlat12;
					    u_xlat6.x = u_xlat6.x * _LightShadowData.z + _LightShadowData.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
					#else
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					#endif
					    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToShadow[3].xyz;
					    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat16_20 = (-_LightShadowData.x) + 1.0;
					    u_xlat16_20 = u_xlat12 * u_xlat16_20 + _LightShadowData.x;
					    u_xlat16_5.x = (-u_xlat16_20) + unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.w;
					    u_xlat16_20 = u_xlat6.x * u_xlat16_5.x + u_xlat16_20;
					    u_xlat16_5.xyz = vec3(u_xlat16_20) * _LightColor0.xyz;
					    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
					    u_xlat16_20 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_20 = max(u_xlat16_20, 0.0);
					    SV_Target0.xyz = u_xlat16_5.xyz * vec3(u_xlat16_20) + u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "INSTANCING_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
			}
		}
		Pass {
			Name "PREPASS"
			LOD 150
			Tags { "LIGHTMODE" = "PREPASSBASE" "RenderType" = "Opaque" }
			Cull Off
			GpuProgramID 75730
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					varying highp vec3 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					varying highp vec3 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					varying highp vec3 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					varying highp vec3 vs_TEXCOORD0;
					#define SV_Target0 gl_FragData[0]
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					out highp vec3 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					out highp vec3 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					out highp vec3 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					out highp vec3 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD0.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					out highp vec3 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD0.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					out highp vec3 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD0.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					in highp vec3 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3"
				}
			}
		}
		Pass {
			Name "PREPASS"
			LOD 150
			Tags { "LIGHTMODE" = "PREPASSFINAL" "RenderType" = "Opaque" }
			ZWrite Off
			Cull Off
			GpuProgramID 190430
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _LightBuffer;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _LightBuffer;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _LightBuffer;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _LightBuffer;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _LightBuffer;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _LightBuffer;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _LightBuffer;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _LightBuffer;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _LightBuffer;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _LightBuffer;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _LightBuffer;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _LightBuffer;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec4 vs_TEXCOORD2;
					varying highp vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					vec3 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat0.zw;
					    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat5 * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat1.zw;
					    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat5 * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat1.zw;
					    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat5 * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat1.zw;
					    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					vec3 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					int u_xlati5;
					float u_xlat10;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat10 * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat1.zw;
					    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5 = inversesqrt(u_xlat5);
					    u_xlat1.xyz = vec3(u_xlat5) * u_xlat1.xyz;
					    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
					    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
					    u_xlat16_3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					vec3 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					int u_xlati5;
					float u_xlat10;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat10 * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat1.zw;
					    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5 = inversesqrt(u_xlat5);
					    u_xlat1.xyz = vec3(u_xlat5) * u_xlat1.xyz;
					    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
					    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
					    u_xlat16_3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					vec3 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					int u_xlati5;
					float u_xlat10;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat10 * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat1.zw;
					    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5 = inversesqrt(u_xlat5);
					    u_xlat1.xyz = vec3(u_xlat5) * u_xlat1.xyz;
					    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
					    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
					    u_xlat16_3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
					    u_xlat0.xyz = (-u_xlat16_1.xyz) + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat5 * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat1.zw;
					    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat5 * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat1.zw;
					    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat5 * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat1.zw;
					    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					vec3 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					int u_xlati5;
					float u_xlat10;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat10 * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat1.zw;
					    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5 = inversesqrt(u_xlat5);
					    u_xlat1.xyz = vec3(u_xlat5) * u_xlat1.xyz;
					    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
					    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
					    u_xlat16_3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					vec3 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					int u_xlati5;
					float u_xlat10;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat10 * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat1.zw;
					    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5 = inversesqrt(u_xlat5);
					    u_xlat1.xyz = vec3(u_xlat5) * u_xlat1.xyz;
					    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
					    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
					    u_xlat16_3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out highp vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					vec3 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					mediump vec3 u_xlat16_4;
					float u_xlat5;
					int u_xlati5;
					float u_xlat10;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD1.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat10 * 0.5;
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    vs_TEXCOORD2.zw = u_xlat1.zw;
					    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5 = inversesqrt(u_xlat5);
					    u_xlat1.xyz = vec3(u_xlat5) * u_xlat1.xyz;
					    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
					    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
					    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_2);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_2);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_2);
					    u_xlat16_3.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_3.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					UNITY_LOCATION(1) uniform mediump sampler2D _LightBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
					    u_xlat16_0.xyz = texture(_LightBuffer, u_xlat0.xy).xyz;
					    u_xlat16_1.xyz = max(u_xlat16_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = u_xlat16_1.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
			}
		}
		Pass {
			Name "DEFERRED"
			LOD 150
			Tags { "LIGHTMODE" = "DEFERRED" "RenderType" = "Opaque" }
			Cull Off
			GpuProgramID 202616
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_draw_buffers
					#extension GL_EXT_draw_buffers : enable
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					#define SV_Target1 gl_FragData[1]
					#define SV_Target2 gl_FragData[2]
					#define SV_Target3 gl_FragData[3]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_draw_buffers
					#extension GL_EXT_draw_buffers : enable
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					#define SV_Target1 gl_FragData[1]
					#define SV_Target2 gl_FragData[2]
					#define SV_Target3 gl_FragData[3]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_draw_buffers
					#extension GL_EXT_draw_buffers : enable
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					#define SV_Target1 gl_FragData[1]
					#define SV_Target2 gl_FragData[2]
					#define SV_Target3 gl_FragData[3]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying mediump vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_draw_buffers
					#extension GL_EXT_draw_buffers : enable
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying mediump vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					#define SV_Target1 gl_FragData[1]
					#define SV_Target2 gl_FragData[2]
					#define SV_Target3 gl_FragData[3]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz;
					    SV_Target3.xyz = exp2((-u_xlat16_1.xyz));
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying mediump vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_draw_buffers
					#extension GL_EXT_draw_buffers : enable
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying mediump vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					#define SV_Target1 gl_FragData[1]
					#define SV_Target2 gl_FragData[2]
					#define SV_Target3 gl_FragData[3]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz;
					    SV_Target3.xyz = exp2((-u_xlat16_1.xyz));
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying mediump vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_draw_buffers
					#extension GL_EXT_draw_buffers : enable
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying mediump vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					#define SV_Target1 gl_FragData[1]
					#define SV_Target2 gl_FragData[2]
					#define SV_Target3 gl_FragData[3]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    u_xlat16_1.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz;
					    SV_Target3.xyz = exp2((-u_xlat16_1.xyz));
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out mediump vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xyz;
					    SV_Target3.xyz = exp2((-u_xlat16_1.xyz));
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out mediump vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xyz;
					    SV_Target3.xyz = exp2((-u_xlat16_1.xyz));
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out mediump vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					mediump vec3 u_xlat16_1;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xyz;
					    SV_Target3.xyz = exp2((-u_xlat16_1.xyz));
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_draw_buffers
					#extension GL_EXT_draw_buffers : enable
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					#define SV_Target1 gl_FragData[1]
					#define SV_Target2 gl_FragData[2]
					#define SV_Target3 gl_FragData[3]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(0.0, 0.0, 0.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_draw_buffers
					#extension GL_EXT_draw_buffers : enable
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					#define SV_Target1 gl_FragData[1]
					#define SV_Target2 gl_FragData[2]
					#define SV_Target3 gl_FragData[3]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(0.0, 0.0, 0.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_draw_buffers
					#extension GL_EXT_draw_buffers : enable
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					#define SV_Target0 gl_FragData[0]
					#define SV_Target1 gl_FragData[1]
					#define SV_Target2 gl_FragData[2]
					#define SV_Target3 gl_FragData[3]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(0.0, 0.0, 0.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(0.0, 0.0, 0.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(0.0, 0.0, 0.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(0.0, 0.0, 0.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying mediump vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_draw_buffers
					#extension GL_EXT_draw_buffers : enable
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying mediump vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					#define SV_Target1 gl_FragData[1]
					#define SV_Target2 gl_FragData[2]
					#define SV_Target3 gl_FragData[3]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target3.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying mediump vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_draw_buffers
					#extension GL_EXT_draw_buffers : enable
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying mediump vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					#define SV_Target1 gl_FragData[1]
					#define SV_Target2 gl_FragData[2]
					#define SV_Target3 gl_FragData[3]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target3.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES
					#ifdef VERTEX
					#version 100
					
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					attribute highp vec4 in_POSITION0;
					attribute highp vec3 in_NORMAL0;
					attribute highp vec4 in_TEXCOORD0;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying highp vec3 vs_TEXCOORD2;
					varying highp vec4 vs_TEXCOORD3;
					varying mediump vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 100
					#ifdef GL_EXT_draw_buffers
					#extension GL_EXT_draw_buffers : enable
					#endif
					
					#ifdef GL_FRAGMENT_PRECISION_HIGH
					    precision highp float;
					#else
					    precision mediump float;
					#endif
					precision highp int;
					uniform lowp sampler2D _MainTex;
					varying highp vec2 vs_TEXCOORD0;
					varying highp vec3 vs_TEXCOORD1;
					varying mediump vec3 vs_TEXCOORD4;
					#define SV_Target0 gl_FragData[0]
					#define SV_Target1 gl_FragData[1]
					#define SV_Target2 gl_FragData[2]
					#define SV_Target3 gl_FragData[3]
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target3.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out mediump vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target3.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xyz;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out mediump vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target3.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xyz;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	mediump vec4 unity_SHAr;
					uniform 	mediump vec4 unity_SHAg;
					uniform 	mediump vec4 unity_SHAb;
					uniform 	mediump vec4 unity_SHBr;
					uniform 	mediump vec4 unity_SHBg;
					uniform 	mediump vec4 unity_SHBb;
					uniform 	mediump vec4 unity_SHC;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out mediump vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
					    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
					    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
					    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
					    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
					    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
					    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
					    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat16_2.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4.xyz = u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target3.xyz = u_xlat16_0.xyz * vs_TEXCOORD4.xyz;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out mediump vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					int u_xlati5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat5.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_3 = u_xlat5.y * u_xlat5.y;
					    u_xlat16_3 = u_xlat5.x * u_xlat5.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
					    vs_TEXCOORD4.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	int unity_BaseInstanceID;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD4;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					int u_xlati9;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat1.w = 1.0;
					    SV_Target2 = u_xlat1;
					    u_xlati9 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati9 = u_xlati9 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_2.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
					    SV_Target3.xyz = exp2((-u_xlat16_2.xyz));
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out mediump vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					int u_xlati5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat5.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_3 = u_xlat5.y * u_xlat5.y;
					    u_xlat16_3 = u_xlat5.x * u_xlat5.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
					    vs_TEXCOORD4.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	int unity_BaseInstanceID;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD4;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					int u_xlati9;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat1.w = 1.0;
					    SV_Target2 = u_xlat1;
					    u_xlati9 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati9 = u_xlati9 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_2.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
					    SV_Target3.xyz = exp2((-u_xlat16_2.xyz));
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out mediump vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					int u_xlati5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat5.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_3 = u_xlat5.y * u_xlat5.y;
					    u_xlat16_3 = u_xlat5.x * u_xlat5.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
					    vs_TEXCOORD4.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	int unity_BaseInstanceID;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD4;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					int u_xlati9;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat1.w = 1.0;
					    SV_Target2 = u_xlat1;
					    u_xlati9 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati9 = u_xlati9 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_2.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
					    SV_Target3.xyz = exp2((-u_xlat16_2.xyz));
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(0.0, 0.0, 0.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(0.0, 0.0, 0.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					flat out highp uint vs_SV_InstanceID0;
					float u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati0 = int(u_xlati0 << 3);
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0 = inversesqrt(u_xlat0);
					    vs_TEXCOORD1.xyz = vec3(u_xlat0) * u_xlat1.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp float;
					precision highp int;
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					void main()
					{
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = 1.0;
					    SV_Target2 = u_xlat0;
					    SV_Target3 = vec4(0.0, 0.0, 0.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out mediump vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					int u_xlati5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat5.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_3 = u_xlat5.y * u_xlat5.y;
					    u_xlat16_3 = u_xlat5.x * u_xlat5.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
					    vs_TEXCOORD4.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	int unity_BaseInstanceID;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD4;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					int u_xlati9;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat1.w = 1.0;
					    SV_Target2 = u_xlat1;
					    u_xlati9 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati9 = u_xlati9 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_2.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target3.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out mediump vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					int u_xlati5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat5.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_3 = u_xlat5.y * u_xlat5.y;
					    u_xlat16_3 = u_xlat5.x * u_xlat5.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
					    vs_TEXCOORD4.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	int unity_BaseInstanceID;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD4;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					int u_xlati9;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat1.w = 1.0;
					    SV_Target2 = u_xlat1;
					    u_xlati9 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati9 = u_xlati9 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_2.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target3.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	int unity_BaseInstanceID;
					uniform 	vec4 _MainTex_ST;
					struct unity_Builtins0Array_Type {
						vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
						vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
					#endif
						UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec4 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec3 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					out mediump vec3 vs_TEXCOORD4;
					flat out highp uint vs_SV_InstanceID0;
					int u_xlati0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					mediump float u_xlat16_3;
					mediump vec3 u_xlat16_4;
					vec3 u_xlat5;
					int u_xlati5;
					void main()
					{
					    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
					    u_xlati5 = int(u_xlati0 << 3);
					    u_xlati0 = u_xlati0 * 7;
					    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat2 = u_xlat1 + unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
					    vs_TEXCOORD2.xyz = unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati5 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat5.xyz;
					    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat16_3 = u_xlat5.y * u_xlat5.y;
					    u_xlat16_3 = u_xlat5.x * u_xlat5.x + (-u_xlat16_3);
					    u_xlat16_1 = u_xlat5.yzzx * u_xlat5.xyzz;
					    u_xlat16_4.x = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBrArray, u_xlat16_1);
					    u_xlat16_4.y = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBgArray, u_xlat16_1);
					    u_xlat16_4.z = dot(unity_Builtins2Array[u_xlati0 / 7].unity_SHBbArray, u_xlat16_1);
					    vs_TEXCOORD4.xyz = unity_Builtins2Array[u_xlati0 / 7].unity_SHCArray.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
					    vs_SV_InstanceID0 = uint(gl_InstanceID);
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
						#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
					#endif
					
					precision highp float;
					precision highp int;
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform 	int unity_BaseInstanceID;
					struct unity_Builtins2Array_Type {
						mediump vec4 unity_SHArArray;
						mediump vec4 unity_SHAgArray;
						mediump vec4 unity_SHAbArray;
						mediump vec4 unity_SHBrArray;
						mediump vec4 unity_SHBgArray;
						mediump vec4 unity_SHBbArray;
						mediump vec4 unity_SHCArray;
					};
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					UNITY_BINDING(0) uniform UnityInstancing_PerDraw2 {
					#endif
						UNITY_UNIFORM unity_Builtins2Array_Type unity_Builtins2Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					};
					#endif
					UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD1;
					in mediump vec3 vs_TEXCOORD4;
					flat in highp uint vs_SV_InstanceID0;
					layout(location = 0) out mediump vec4 SV_Target0;
					layout(location = 1) out mediump vec4 SV_Target1;
					layout(location = 2) out mediump vec4 SV_Target2;
					layout(location = 3) out mediump vec4 SV_Target3;
					mediump vec3 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					int u_xlati9;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat1.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat1.w = 1.0;
					    SV_Target2 = u_xlat1;
					    u_xlati9 = int(vs_SV_InstanceID0) + unity_BaseInstanceID;
					    u_xlati9 = u_xlati9 * 7;
					    u_xlat1.xyz = vs_TEXCOORD1.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat16_2.x = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHArArray, u_xlat1);
					    u_xlat16_2.y = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHAgArray, u_xlat1);
					    u_xlat16_2.z = dot(unity_Builtins2Array[u_xlati9 / 7].unity_SHAbArray, u_xlat1);
					    u_xlat16_2.xyz = u_xlat16_2.xyz + vs_TEXCOORD4.xyz;
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat16_2.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target3.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
					    SV_Target3.w = 1.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "INSTANCING_ON" "LIGHTPROBE_SH" "UNITY_HDR_ON" }
					"!!!!GLES3"
				}
			}
		}
	}
	Fallback "Mobile/VertexLit"
}