using System.Collections.Generic;
using UnityEngine;

public class ObstaclesActivator : MonoBehaviour
{
    public List<GameObject> Obstacles;
    // Start is called before the first frame update
    void Start()
    {

    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            activate();
        }
    }
    void activate()
    {
        foreach (GameObject g in Obstacles)
        {
            if (g)
            {
                if (g.GetComponent<Rigidbody>())
                    g.GetComponent<Rigidbody>().isKinematic = false;
            }
        }
    }
}
