using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DamageEffect : MonoBehaviour
{
    public List<GameObject> Blood;
    // Start is calleVBd before the first frame update
    void Start()
    {
        
    }
    public void Instantiate(Collider hit)
    {
      GameObject BLP=  Instantiate(Blood[Random.Range(0,Blood.Count)].gameObject,hit.transform.position,hit.transform.rotation);
    }
    
}
