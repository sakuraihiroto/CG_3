#include "BasicShaderHeader.hlsli"

//三角形の入力から、線分を3つ出力するサンプル
[maxvertexcount(6)]
void main(
	triangle VSOutput input[3] : SV_POSITION,
	//線分ストリーム
	inout TriangleStream< GSOutput > output
)
{
	//1つ目の三角形
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element; //出力用頂点データ
		element.svpos = input[i].svpos; //頂点座標をコピー
		element.normal = input[i].normal; //法線をコピー
		element.uv = input[i].uv; //UVをコピー
		output.Append(element);
	}
	//現在のストリップを終了
	output.RestartStrip();
	//2つ目の三角形
	for (uint i = 0; i < 3; i++)
	{
		GSOutput element;
		//X方向に20ずらす
		element.svpos = input[i].svpos + float4(20.0f, 0.0f, 0.0f,0.0f); //頂点座標をコピー
		element.normal = input[i].normal; //法線をコピー
		//UVを5倍に
		element.uv = input[i].uv * 5.0f; //UVをコピー
		output.Append(element);
	}
}
