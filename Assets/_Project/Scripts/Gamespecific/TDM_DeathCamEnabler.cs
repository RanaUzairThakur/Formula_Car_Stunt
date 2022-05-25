using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TDM_DeathCamEnabler : MonoBehaviour
{

    public Transform target;
    Vector3 targetOffset =new Vector3(0,4,-3);
    Vector3 targetOffsetLookAt =new Vector3(0,4,0);
    // Start is called before the first frame update
    void Start()
    {
        
    }
    private void FixedUpdate()
    {
        transform.position = Vector3.Lerp(/*GameManager.Instance.fpsRoot.*/transform.position, target.position+targetOffset, Time.deltaTime*2f);
        transform.LookAt(target, targetOffsetLookAt);

    }
    private void OnEnable()
    {
        //StartCoroutine(TurnPreCameraOn());
    }
    //IEnumerator TurnPreCameraOn()
    //{
        //yield return new WaitForSecondsRealtime(1);
        //Time.timeScale = 0;
        //yield return new WaitForSecondsRealtime(2);
        //HudMenuListener.Instance.hudMenu.SetActive(false);

        //GameManagerTDM.Instance.preGameCam.SetActive(true);
        //gameObject.SetActive(false);
    //}

}
