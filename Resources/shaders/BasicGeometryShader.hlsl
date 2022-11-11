#include "BasicShaderHeader.hlsli"

//点の入力から、三角形を出力
[maxvertexcount(3)]
void main(
	point VSOutput input[1] : SV_POSITION,
	//線分ストリーム
	inout TriangleStream< GSOutput > output
)
{
	GSOutput element; //出力用頂点データ
	//共通
	element.normal = input[0].normal;
	element.uv = input[0].uv;
	//1点目
	element.svpos = input[0].svpos;
	output.Append(element);
	//2点目
	element.svpos = input[0].svpos + float4(10.0f, 10.0f, 0, 0);
	output.Append(element);
	//3点目
	element.svpos = input[0].svpos + float4(10.0f, 0, 0, 0);
	output.Append(element);
}
	
