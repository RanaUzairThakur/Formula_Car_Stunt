using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Vehicleselectionlistener : MonoBehaviour
{
    // Start is called before the first frame update

    public List<GameObject> Disableobject;
    public List<GameObject> Enableaobject;
    public GameObject startstage;
    private void OnEnable()
    {
       
        foreach (GameObject g in Enableaobject)
            g.SetActive(true);
        startstage.SetActive(false);
    }
    private void OnDisable()
    {
       
        foreach (GameObject g in Disableobject)
            g.SetActive(false);
        startstage.SetActive(true);
    }
}
