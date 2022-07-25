using UnityEngine;

public class AirControl : MonoBehaviour
{

    WheelHit wheelHit;
    public float dsitance = 4f;
    public GameObject carModel;
    private float speed = 50f;
    private Vector3 forwardDirection;
    private float rotationAmount;
    RCC_CarControllerV3 car;
    private float _X;
    private float _y;
    private float _z;
    bool check;
     private RaycastHit hit;
    private bool isAircontrolTutorialOn=false;
    // public Transform raycastPoint;
    Rigidbody Rb;
    private HUDListner hud;
    private void Start()
    {
        car = gameObject.GetComponent<RCC_CarControllerV3>();
        Rb = gameObject.GetComponent<Rigidbody>();
        hud = FindObjectOfType<HUDListner>();
    }
    void FixedUpdate()
    {
        if (!IsGrounded())
        {
           // RaycastHit hit;
            if (Physics.Raycast(transform.position, Vector3.down, out hit, dsitance))
            {
                if (!check)
                    check = true;
                // Its Just Tutorial for Specific Stunt
                if (isAircontrolTutorialOn)
                {
                    Toolbox.HUDListner.set_StatusAicontrolsTutorial(false);
                    isAircontrolTutorialOn = false;
                }
                // Aircontrols Indicators On ff acrtoding Aircontrols On Off
                
                hud.set_StatusAicontrolsIndicators(false);
                //Debug.DrawRay(transform.position, Vector3.down, Color.green, dsitance);
                //   print("Hit");
            }
            else
            {
              //  print("steerInput :"+car.steerInput);
                var slopeRotation = Quaternion.FromToRotation(transform.up, hit.normal);
                transform.rotation = Quaternion.Slerp(transform.rotation, slopeRotation * transform.rotation, 0.5f * Time.fixedDeltaTime);
                rotationAmount = car.steerInput * (50f);
                rotationAmount *= Time.deltaTime;
                _X = carModel.transform.position.x;
                _y = carModel.transform.position.y;
                _z = carModel.transform.position.z;
                _X += rotationAmount;
                carModel.transform.position = new Vector3(_X, _y, _z);
                if (check)
                {
                    Rb.angularVelocity = Vector3.zero;
                    check = false;
                }
                hud.set_StatusAicontrolsIndicators(true);
            }
        }
        else
        {
            hud.set_StatusAicontrolsIndicators(false);
        }
        
    }
    public void In()
    {

        rotationAmount = car.steerInput * -40f;
        rotationAmount *= Time.deltaTime;
        float _X = carModel.transform.position.x;
        float _y = carModel.transform.position.y;
        float _z = carModel.transform.position.z;
        _z += rotationAmount;
        carModel.transform.position = new Vector3(_X, _y, _z);
        Invoke("Out", 0f);

    }
    public void Out()
    {
        Time.timeScale = 1f;
    }
    bool IsGrounded()
    {

        if (car.isGrounded)
            return true;
        else
            return false;
    }


    void OnTriggerEnter(Collider col)
    {
        if (col.gameObject.CompareTag("AircontrolsOn"))
        {
            if (!isAircontrolTutorialOn)
            {
                Toolbox.HUDListner.set_StatusAicontrolsTutorial(true);
                Time.timeScale = 0.0f;
                isAircontrolTutorialOn = true;
            }
        }

    }
}
