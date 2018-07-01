//struct VOut
//{
//    float4 position : SV_POSITION;
//    float4 color : COLOR;
//};
//
//VOut VShader(float4 position : POSITION, float4 color : COLOR)
//{
//    VOut output;
//
//    output.position = position;
//    output.color = color;
//
//    return output;
//}
//
//
//float4 PShader(float4 position : SV_POSITION, float4 color : COLOR) : SV_TARGET
//{
//    return color;
//}

struct VS_OUTPUT
{
	float4 Pos : SV_POSITION;
	float phase : ATTRIBUTE0;
};

VS_OUTPUT VShader(float4 position : POSITION, float4 color : COLOR)
{
	VS_OUTPUT output;
	output.Pos = position;
	output.phase = position.y;

	return output;
}

float4 PShader(VS_OUTPUT input) : SV_TARGET
{
	float R = fmod(float3(input.phase * 99, 0, 0),1.0).x;
	return float4(R, 0, 0, 1);
}