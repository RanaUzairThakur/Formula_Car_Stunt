using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpeedDetector : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    private void Update()
    {
        if (Toolbox.GameplayController.SelectedVehicleRccv3)
            Toolbox.HUDListner.Setstatus_speed(Toolbox.GameplayController.SelectedVehicleRccv3.speed);
    }
}
