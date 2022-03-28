using System;
using UnityEngine;
using Random = UnityEngine.Random;

namespace UnityStandardAssets.Effects
{
    public class SmokeParticles : MonoBehaviour
    {
        public AudioClip[] extinGCHCIhSounds;


        private void Start()
        {
            GetComponent<AudioSource>().clip = extinGCHCIhSounds[Random.Range(0, extinGCHCIhSounds.Length)];
            GetComponent<AudioSource>().Play();
        }
    }
}
