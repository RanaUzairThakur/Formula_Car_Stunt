
using UnityEngine;

public class LevelHandler : MonoBehaviour
{
    public Transform[] SpawnPoint;
    public Transform[] TargetPoint;

    private void Start()
    {

        Toolbox.GameplayController.Enemyspwanpoint = SpawnPoint;
        Toolbox.GameplayController.Targetpoint = TargetPoint;
      //  Toolbox.Set_levelhandler(this);
    }
 
}
