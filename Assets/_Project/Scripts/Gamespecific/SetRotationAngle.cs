using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SetRotationAngle : MonoBehaviour
{
    public float Targetangle = 0f;
    public bool X=false;
    public bool Y=false;
    public bool Z=false;
    public bool XY = false;
    public bool XZ = false;
    public bool YZ = false;
    // Start is called before the first frame update
    void Start()
    {
        
    }
    void OnTriggerEnter(Collider col)
    {
        if (col.gameObject.CompareTag("Player"))
        {
            if (this.tag == "AirstableOn")
            {
               if(X)
                    col.gameObject.GetComponentInParent<AirStabiity>().Set_StatusrotationAngle(Targetangle,RotationAxis.X);
              else if(Y)
                    col.gameObject.GetComponentInParent<AirStabiity>().Set_StatusrotationAngle(Targetangle, RotationAxis.Y);
               else if(Z)
                    col.gameObject.GetComponentInParent<AirStabiity>().Set_StatusrotationAngle(Targetangle, RotationAxis.Z);
                else if (XY)
                    col.gameObject.GetComponentInParent<AirStabiity>().Set_StatusrotationAngle(Targetangle, RotationAxis.XY);
                else if (XZ)
                    col.gameObject.GetComponentInParent<AirStabiity>().Set_StatusrotationAngle(Targetangle, RotationAxis.XZ);
                else if (YZ)
                    col.gameObject.GetComponentInParent<AirStabiity>().Set_StatusrotationAngle(Targetangle, RotationAxis.YZ);
            }
            else if (this.gameObject.tag == "Airstableoff")
            {
                X=Y=Z= false;
                col.gameObject.GetComponentInParent<AirStabiity>().Set_StatusrotationAngle(0, RotationAxis.None);

            }
        }
        
    }
}
