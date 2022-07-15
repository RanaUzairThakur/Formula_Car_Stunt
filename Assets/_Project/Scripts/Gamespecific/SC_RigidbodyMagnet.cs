using System.Collections.Generic;
using UnityEngine;

public class SC_RigidbodyMagnet : MonoBehaviour
{
    public float magnetForce = 100;
    public bool move;
    public float distance;
    //public GameObject Player;
    //List<Rigidbody> caughtRigidbodies = new List<Rigidbody>();

    void FixedUpdate()
    {
       
        if (move)
        {
            transform.position = Vector3.MoveTowards(transform.position, HR_GamePlayHandler.Instance.player.transform.position, magnetForce * Time.deltaTime);
            distance = this.transform.position.magnitude - HR_GamePlayHandler.Instance.player.transform.position.magnitude;
            if (distance <= 0)
                this.gameObject.SetActive(false);
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.CompareTag("Player"))
        {
            move = true;
        }
        

    }

    
}