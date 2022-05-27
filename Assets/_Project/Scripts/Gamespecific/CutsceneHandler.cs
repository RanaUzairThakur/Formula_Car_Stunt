using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CutsceneHandler : MonoBehaviour
{
    public float Completetime;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    public void End()
    {
        Toolbox.CutsceneManager.FinishCutscene();
    }
}
