using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

[CreateAssetMenu(fileName = "LevelData", menuName = "ScriptableObjects/Level")]
public class LevelsData : ScriptableObject
{
    [Header("[*****Wave Data *****]")]
    //[Space(10)]
    public int totalEnemy;
    public WaveData wavedata;
    public float waveDelaytime;
    public List<GameObject> Enemytypes;

    [Space(10)]
    [Header("[*****Enemy Data *****]")]
    [Space(10)]
    public float EnemyHealth;
    public float enemyBulletDamage;
    public float MaxDistanceEnemyspawn;
    public float MinDistanceEnemyspawn;
    public int NoSapawnedLastEnemy;
    //public float IdleSpeed =5;
    //public float runspeed = 5;
    //public float AlertSpeed =5;

    [Space(10)]
    [Header("[*****Player Data *****]")]
    [Space(10)]
    public float PlayerHealth;
    public float playerBulletDamage;

    public enum objectivetype { ShotKill, LastKillSlowmo,HealthInjection,AirDrop,Nothing}
    [Header("[*****Level Objective Type*****]")]
    public objectivetype ObjectiveType;

    public enum pickuppack {Nothing, GunPistolAndHealth, ShotAndHealth, ShotPistolAndHealth, SMGAndHealth, ShotPistolSMGAndHealth, Ammo, HealthPack,Gun,UltraPack}
    [Space(10)]
    [Header("[*****Pick Up Item After Enemy Death*****]")]
    [Space(10)]
    public bool Revive;
    public bool StartAnim;
    public bool SlomoBulletKill;
    public bool EnableObjects;
    public bool Bosslevel;
    public bool ExplosionDrumlevel;
    public bool ExplosionGernadelevel;
    public pickuppack PickUpPack;

    public enum modetype{Day,Night,Random }
    [Header("[*****Level Mode Type*****]")]
    public modetype ModeType;
}
[Serializable]
public class WaveData
{
    public EachWave[] wave;
}

[Serializable]
public class EachWave
{
    public int enemyEachWave;
    public float Activetime;
    public bool EnableItemAfterWave;
}

