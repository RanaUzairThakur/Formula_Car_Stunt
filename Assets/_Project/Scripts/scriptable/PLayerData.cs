using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "PlayerData", menuName = "ScriptableObjects/Player")]
public class PLayerData : ScriptableObject
{
    public float PlayerHealth;
    public float playerBulletDamage;
}
