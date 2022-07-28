using System.Collections.Generic;
using UnityEngine;

public class StuntCameraHandler : MonoBehaviour
{
    public Transform InitialPoint;
    public List<Transform> TargetpointList;
    public Transform TargetPoint;
    public Transform Pivot;
    public bool stunt;
    public float smoothrotation;
    public Vector3 offsetPosition;
    public bool Reversestuntcam = false;
    public float staytime = 2f;
    public bool left, Right;
    private bool stay = false;
    private float currentstaytime;
    private int ran;
    public float TargetAngle = 90f;
    private EffectListener SFX;
    // Start is called before the first frame update
    void Start()
    {

        if (!SFX)
            SFX = Toolbox.GameplayController.SelectedVehiclePrefab.GetComponent<EffectListener>();
        currentstaytime = staytime;
        Assing_targetpoint();
    }

    // Update is called once per frame
    void Update()
    {
        if (stunt)
        {
            Quaternion target = Quaternion.Euler(TargetPoint.localRotation.x, /*TargetPoint.localRotation.y*/ TargetAngle /*90f*/, TargetPoint.localRotation.z);
            Pivot.localRotation = Quaternion.Slerp(Pivot.localRotation, target, Time.deltaTime * smoothrotation);
            Pivot.position = Vector3.Lerp(Pivot.position, TargetPoint.position, Time.deltaTime * smoothrotation);
            if (Pivot.transform.position.x <= TargetPoint.position.x + offsetPosition.x && !stay)
            {
                print("Reach At Target");
                stay = true;
            }
            if (stay)
            {
                currentstaytime -= Time.deltaTime;
                if (currentstaytime < 0)
                {
                    stunt = false;
                    Reversestuntcam = true;
                    stay = false;
                    currentstaytime = staytime;
                }

            }
        }
        else if (Reversestuntcam)
        {
            Quaternion target = Quaternion.Euler(InitialPoint.rotation.x, InitialPoint.rotation.y, InitialPoint.rotation.z);
            Pivot.localRotation = Quaternion.Slerp(Pivot.localRotation, target, Time.deltaTime * smoothrotation);
            Pivot.position = Vector3.Lerp(Pivot.position, InitialPoint.position, Time.deltaTime * smoothrotation);
            if (Right)
            {
              
                if (Pivot.transform.position.x <= InitialPoint.position.x + offsetPosition.x && !stay)
                {
                    print("Reach At Initial");
                    if (!Toolbox.GameplayController.IsFinish)
                        Toolbox.GameplayController.HUD_Status(true);
                    Reversestuntcam = false;
                  //  Time.timeScale = 1f;
                }
            }
            else
            {
                if (Pivot.transform.position.x + offsetPosition.x >= InitialPoint.position.x && !stay)
                {
                    print("Reach At Initial");
                    if (!Toolbox.GameplayController.IsFinish)
                        Toolbox.GameplayController.HUD_Status(true);
                    Reversestuntcam = false;
                  //  Time.timeScale = 1f;
                }
            }
        }
    }

    private void Assing_targetpoint()
    {
        foreach (Transform t in SFX.stuntcamerapoint)
        {
            TargetpointList.Add(t);
            //TargetPoint = t;
        }
    }

    public void set_StatusStunt()
    {
        ran = Random.Range(0, TargetpointList.Count);
        if (ran == 0)
        {

            TargetAngle = 90f;
            left = true;
            Right = false;
        }
        else
        {
            TargetAngle = -90;
            left = false;
            Right = true;
        }
        stunt = true;
        TargetPoint = TargetpointList[ran];
        Toolbox.GameplayController.HUD_Status(false);
       // Time.timeScale = 0.5f;
    }

}
