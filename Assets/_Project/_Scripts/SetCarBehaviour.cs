using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SetCarBehaviour : MonoBehaviour
{
    bool isSetting = false;
    private Vector3 initialPos;
    public WheelCollider[] wheelColliders; //add each wheel's WheelCollider to this array in the Inspector

   // public GameObject levelPanel;

    WheelHit wheelHit;
    
    void Start()
    {
        initialPos = transform.position;
        isSetting = false;
    }

    // Update is called once per frame
    void Update()
    {
        if (!IsGrounded())
        {
            Invoke("CarRotSet", 0.5f);
        }
    }

    void CarRotSet()
    {
        var targetPoint = new Vector3(0, 0, 0);
        var targetRotation = Quaternion.LookRotation(targetPoint, Vector3.up);
        transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, Time.fixedDeltaTime * 2.5f);
        Time.timeScale = 0.92f;
        //ChangeCamera();
        Invoke("Set", 2f);
    }

    bool IsGrounded()
    {
        //Check if any wheelColliders[] element is touching 
        //the ground - if one is, then we're grounded so 
        //return true.
        //You could have slightly more complex requirements 
        //here like needing at least 2 wheels touching the
        //ground to drive.
        foreach (WheelCollider w in wheelColliders)
        {
            if (w.GetGroundHit(out wheelHit))
                return true; //at least one wheel is touching the ground
        }
        return false;
    }

    void Set()
    {
        Time.timeScale =1;
        //isSetting = false;
        //RevertCamera();
    }

    public void ResetButton()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }

    public void ChangeCamera()
    {

        if (RCC_SceneManager.Instance.activePlayerCamera)
            RCC_SceneManager.Instance.activePlayerCamera.ChangeCamera();

        RCC_SceneManager.Instance.activePlayerCamera.cameraSwitchCount = 1;
    }

    public void RevertCamera()
    {

        if (RCC_SceneManager.Instance.activePlayerCamera)
            RCC_SceneManager.Instance.activePlayerCamera.ChangeCamera();

        RCC_SceneManager.Instance.activePlayerCamera.cameraSwitchCount = -1;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Complete")
        {
            //StartCoroutine(RotateTheCar(1.5f));
            isSetting = true;

           // print("reached at destination");

            //levelPanel.SetActive(true);
        }
    }
}
