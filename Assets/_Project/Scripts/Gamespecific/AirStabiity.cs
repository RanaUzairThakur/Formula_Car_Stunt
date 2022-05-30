using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AirStabiity : MonoBehaviour
{
    GameObject Player;
     public bool stablerotation;
    private float smoothrotation = 3f;
    public float Targetangle = 0f;
    //public bool Airdragactivate;
    // Start is called before the first frame update
    //RCC_CarControllerV3 rccv3;
    //void Start()
    //{
    //    rccv3 = GetComponent<RCC_CarControllerV3>();
    //}
    private void Update()
    {
        // smooth rotation for stability
        if (stablerotation)
        {
            // Quaternion target = Quaternion.Euler(transform.rotation.x, 0f, transform.rotation.z);
            Quaternion target = Quaternion.Euler(transform.rotation.x, Targetangle, transform.rotation.z);
            transform.rotation = Quaternion.Slerp(transform.rotation, target, Time.deltaTime * smoothrotation);
        }
        //if (Airdragactivate)
        //{ 
        //    rccv3.DOW
        //}

    }
    void OnTriggerEnter(Collider col)
    {
        if (col.gameObject.CompareTag("AirstableOn"))
        {
            stablerotation = true;
        }
        else if (col.gameObject.CompareTag("Airstableoff"))
        {
            stablerotation = false;
        }
        else if (col.gameObject.tag == "GameOver")
        {
            stablerotation = false;

        }
    }
}
