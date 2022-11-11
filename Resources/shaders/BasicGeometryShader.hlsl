#include "BasicShaderHeader.hlsli"

//�l�p�`�̒��_��
static const uint vnum = 4;

//�Z���^�[����̃I�t�Z�b�g
static const float4 offset_array[vnum] =
{
	float4(-0.5f,-0.5f,0,0), //����
	float4(-0.5f,+0.5f,0,0),//����
	float4(+0.5f,-0.5f,0,0), //�E��
	float4(+0.5f,+0.5f,0,0) //�E��
};
//���オ0,0  �E����1,1
static const float2 uv_array[vnum] =
{
	float2(0,1),
	float2 (0,0),
	float2(1,1),
	float2(1,0)
};
//�_�̓��͂���A�l�p�`���o��
[maxvertexcount(vnum)]
void main
(
	point VSOutput input[1]:SV_POSITION,
	inout TriangleStream<GSOutput>output
)
{
	GSOutput element; //�o�͗p���_�f�[�^
	//4�_��
	for (uint i = 0; i < vnum; i++)
	{
		//���[���h���W�x�[�X�ŁA���炷
		element.svpos = input[0].pos + offset_array[i];
		//�r���[�A�ˉe�s��
		element.svpos = mul(mat, element.svpos);
		/*element.uv = float2(0.5f, 0.5f);*/
		element.uv = uv_array[i];
		output.Append(element);
	}
}
	
