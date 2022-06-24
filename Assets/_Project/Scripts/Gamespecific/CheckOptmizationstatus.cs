using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckOptmizationstatus : MonoBehaviour
{
    public List<GameObject> ObjectsOffForcheapdevice;
    // Start is called before the first frame update
    void Start()
    {
        Optimization();
    }

    private void Optimization()
    {
        if (Toolbox.DB.Prefs.IsDetectVeryCheapDevice)
        {
            Toolbox.GameplayController.Rcccamera.GetComponentInChildren<Camera>().farClipPlane = 70f;
            QualitySettings.shadows = ShadowQuality.Disable;
            foreach (GameObject g in ObjectsOffForcheapdevice)
                g.SetActive(false);
        }
        else if (Toolbox.DB.Prefs.IsDetectLowCheapDevice)
        {
            Toolbox.GameplayController.Rcccamera.GetComponentInChildren<Camera>().farClipPlane = 500f;
            QualitySettings.shadows = ShadowQuality.Disable;
        }
        else if (Toolbox.DB.Prefs.IsDetectMediumCheapDevice)
        {
            Toolbox.GameplayController.Rcccamera.GetComponentInChildren<Camera>().farClipPlane = 1000f;
            
        }
        else
        {
            Toolbox.GameplayController.Rcccamera.GetComponentInChildren<Camera>().farClipPlane = 1000f;
        }
    }
}
