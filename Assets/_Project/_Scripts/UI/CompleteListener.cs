using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CompleteListener : MonoBehaviour
{
    public GameObject finalCam, Fireworks;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    public void OnTriggerEnter(Collider Target)
    {
        if (Target.tag == "Player")
        {
            Target.GetComponentInParent<Rigidbody>().drag = 2f;
            GamePlayManager.inst.RcPanel.SetActive(false);
            Fireworks.SetActive(true);
            GamePlayManager.inst.rccam.SetActive(false);
            finalCam.SetActive(true);
            Invoke(nameof(Vehicle_withdriver), 1.7f);
        }
    }


    private void complete()
    {

        GamePlayManager.inst.Set_statusCongartulations();
        CancelInvoke(nameof(complete));
    }

    IEnumerator skid()
    {
        yield return new WaitForSeconds(1f);
        Time.timeScale = 0;
    }

    private void Vehicle_withdriver()
    {

        SoundsManager1._instance.PlaySound(SoundsManager1._instance.WinAppreciationsound);
        SoundsManager1._instance.Stop_PlayingMusic();
        Invoke(nameof(complete), 3f);
        CancelInvoke(nameof(Vehicle_withdriver));
    }
}
