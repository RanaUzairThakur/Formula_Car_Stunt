using UnityEngine;

[CreateAssetMenu(fileName = "GunData", menuName = "ScriptableObjects/GunSelection_Gun")]
public class GunSelection_Gun : ScriptableObject
{
    public new string name = "";

    public int cost = 100;
    [Range(0, 1)]
    public float Acceleration = 1;
    [Range(0, 1)]
    public float  Handling = 1;
    [Range(0, 1)]
    public float TopSpeed = 1;

}

