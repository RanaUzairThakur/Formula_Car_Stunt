using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomPlayerPositionScript : MonoBehaviour
{
    public Transform[] Points;

    private void Awake()
    {
          Toolbox.Set_RandomPlayerpos(this);
        //if (FindObjectOfType<FPSPlayer>())
        //    FindObjectOfType<FPSPlayer>().FadeinoutLevel();
        //// Set Player Position According to Mode and Levels 
        //   Set_Position();
    }
    //public void Set_Position()
    //{
    //    //print("ModeHnadler");

    //    //if (Constants.gameModeIndex_Mode1 == 0)
    //    //{
    //    if (Toolbox.DB.Prefs.LastSelectedGameMode == 11)
    //    {
    //        //fOR jUST TRAINING mODE
    //        int i = Random.Range(0, Points.Length);
    //        transform.position = Points[i].transform.position;
    //        transform.rotation = Points[i].transform.rotation;
    //    }
    //    else
    //    {
    //        int i = Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode();
    //        transform.position = Points[i].transform.position;
    //        transform.rotation = Points[i].transform.rotation;
    //    }
       
    //}
    //public void Set_Position(Transform pos)
    //{
    //  this.transform.localPosition = pos.localPosition;
    //  this.transform.localRotation = pos.localRotation;
    //}
}
