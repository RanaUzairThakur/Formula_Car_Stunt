using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovePointAssigner_Helli : MonoBehaviour
{
    public List<Transform> MovePoints = new List<Transform>();
    // Start is called before the first frame update
    void Awake()
    {
        Toolbox.Set_MovepointHelli(this);
    }
   
}
