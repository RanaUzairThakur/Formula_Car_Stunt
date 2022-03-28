using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InAppCalling : MonoBehaviour
{
    public void RemoveAd()
    {
        if (InApp_Manager.instance)
        InApp_Manager.instance.Buy_UnlockAll_Removeads();
    }
    public void Unlocklevel()
    {
        if (InApp_Manager.instance)
           InApp_Manager.instance.Buy_UnlockAll_Levels();

    }
    public void UnlockCars()
    {
        if (InApp_Manager.instance)
            InApp_Manager.instance.Buy_UnlockAll_Players();

    }
    public void Megapack()
    {
        if (InApp_Manager.instance)
           InApp_Manager.instance.Buy_UnlockAll_All();

    }
}
