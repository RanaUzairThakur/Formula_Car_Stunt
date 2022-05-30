using System;
using UnityEngine;

namespace UnityStandardAssets.Water
{
    //[ExecuteInEditMode]
    public class WaterBasic : MonoBehaviour
    {
      public  float scrollSpeed = -0.1f;
        Renderer r;
        Material mat,mat2,mat3;
        private void Start()
        {
           r = GetComponent<Renderer>();
           mat = r.materials[0];
            mat2 = r.materials[1];
           //  mat3 = r.materials[2];
        }
        void Update()
        {   
            //if (!r)
            //{
            //    return;
            //}
            //if (!mat || mat2)
            //{
            //    return;
            //}
            //Vector4 waveSpeed = mat.GetVector("WaveSpeed");
            //float waveScale = mat.GetFloat("_WaveScale");
            //float t = Time.time / 20.0f;

            //Vector4 offset4 = waveSpeed * (t * waveScale);
            //Vector4 offsetClamped = new Vector4(Mathf.Repeat(offset4.x, 1.0f), Mathf.Repeat(offset4.y, 1.0f),
            //    Mathf.Repeat(offset4.z, 1.0f), Mathf.Repeat(offset4.w, 1.0f));
            //mat.SetVector("_WaveOffset", offsetClamped);

            Vector2 textureOffset = new Vector2(0, (Time.time * scrollSpeed));
            mat.mainTextureOffset = textureOffset;
            mat2.mainTextureOffset = textureOffset;
           // mat3.mainTextureOffset = textureOffset;
            r.materials[0].SetTextureOffset("_DetailAlbedoMap", textureOffset);
            r.materials[1].SetTextureOffset("_DetailAlbedoMap", textureOffset);
            //r.materials[2].SetTextureOffset("_DetailAlbedoMap", textureOffset);




        }
    }
}