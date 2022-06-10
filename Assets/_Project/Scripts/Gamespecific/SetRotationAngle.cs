using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SetRotationAngle : MonoBehaviour
{
    public float Targetangle = 0f;
    public bool X=false;
    public bool Y=false;
    public bool Z=false;
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
            }
            else if (this.gameObject.tag == "Airstableoff")
            {
                X=Y=Z= false;
                col.gameObject.GetComponentInParent<AirStabiity>().Set_StatusrotationAngle(0, RotationAxis.None);

            }
        }
        
    }
}
