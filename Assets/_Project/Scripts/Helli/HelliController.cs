using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;

public class HelliController : MonoBehaviour
{
    public float speed = 20.0f;
    public float speedupsExternalFactor = 20f;
    //public float speeddownExternalFactor = 20f;

    //public Transform MainPropeller;
    //public Transform TailPropeller;
    public Transform Dropableobject;
    public Transform Parentobject;
    public bool Droped=false;
    Rigidbody rig;
    private Vector3 dropableobjectoriginalpos;
    private float oringnalspeedfactor;
    // Start is called before the first frame update
    void Start()
    {
        oringnalspeedfactor = speedupsExternalFactor;
        rig = GetComponent<Rigidbody>();
        dropableobjectoriginalpos = Dropableobject.position;
       
        Invoke("Drop",Random.Range(12,15));
    }



    void Update()
    {
        speed = Toolbox.GameplayController.SelectedVehicleRccv3.speed /*- speeddownExternalFactor*/;
        // make the ship move at a constant forward speed.
        // rig.velocity = transform.forward * speed * (speedupsExternalFactor * Time.deltaTime);
        //MainPropeller.transform.Rotate(0, speed, 0);
        //TailPropeller.transform.Rotate(speed, 0, 0);

        transform.Translate(Vector3.forward * speed * (speedupsExternalFactor * Time.deltaTime));


    }


    private void OnTriggerEnter(Collider other)
    {
        //if (other.gameObject.CompareTag("Player"))
        //{
        //    this.gameObject.GetComponentInParent<PUBGcutscenecontroller>().DropPlayer();
        //}
    }

    private void OnTriggerExit(Collider other)
    {
        //if (other.gameObject.CompareTag("Player"))
        //{
        //    this.gameObject.SetActive()
        //}
    }

    public void Drop()
    {
        Dropableobject.transform.SetParent(null);
        Droped = true;
        //Dropableobject.GetComponent<BoxCollider>().enabled = true;
        speedupsExternalFactor = 0.35f;
        Invoke(nameof(Hellidisable),Random.Range(4,6));
       
    }

    public void Hellidisable()
    {
        speedupsExternalFactor = 0.35f;
        speedupsExternalFactor = oringnalspeedfactor;
        Dropableobject.transform.SetParent(Parentobject);
        Dropableobject.localPosition = new Vector3(0f, 0f, 0f);
        Dropableobject.gameObject.SetActive(true);
        GetComponentInParent<SpawnableHelli>().Off_spawnableObject();
        CancelInvoke(nameof(Drop));
        CancelInvoke(nameof(Hellidisable));
    }

    public void Pickfly()
    {
        if(Droped)
        {
            Droped = false;
            
        }
        else
        {
            speedupsExternalFactor = 0.35f;
            Invoke(nameof(Hellidisable), Random.Range(4, 6));
        }
    }
   
}
