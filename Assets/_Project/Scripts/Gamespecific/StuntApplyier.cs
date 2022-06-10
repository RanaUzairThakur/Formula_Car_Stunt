using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StuntApplyier : MonoBehaviour
{

    public bool X = false;
    public bool Y = false;
    public bool Z = false;
    public float speed = 300f;
    //int ran = 0;
    // Start is called before the first frame update
    void Start()
    {

    }

    void OnTriggerEnter(Collider col)
    {


        if (col.gameObject.CompareTag("Player"))
        {

            if (this.tag == "stuntrotation")
            {
                //ran = Random.Range(0,3);
                //if (ran ==0 )
                //    col.gameObject.GetComponentInParent<CarstuntHandler>().Set_Statustantrotation(transform.rotation,StuntRotationAxis.X,speed);
                //else if (ran == 1)
                //    col.gameObject.GetComponentInParent<CarstuntHandler>().Set_Statustantrotation(transform.rotation, StuntRotationAxis.Y,speed);
                //else if (ran == 2)
                //    col.gameObject.GetComponentInParent<CarstuntHandler>().Set_Statustantrotation(transform.rotation, StuntRotationAxis.Z,speed);

                if (X)
                    col.gameObject.GetComponentInParent<CarstuntHandler>().Set_Statustantrotation(transform.rotation, StuntRotationAxis.X, speed);
                else if (Y)
                    col.gameObject.GetComponentInParent<CarstuntHandler>().Set_Statustantrotation(transform.rotation, StuntRotationAxis.Y, speed);
                else if (Z)
                    col.gameObject.GetComponentInParent<CarstuntHandler>().Set_Statustantrotation(transform.rotation, StuntRotationAxis.Z, speed);
            }
            //else if (this.gameObject.tag == "Airstableoff")
            //{
            //    X = Y = Z = false;
            //    col.gameObject.GetComponentInParent<AirStabiity>().Set_StatusrotationAngle(0, RotationAxis.None);

            //}
        }

    }

}
