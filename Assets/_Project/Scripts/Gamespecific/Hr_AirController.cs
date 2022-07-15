using UnityEngine;

public class Hr_AirController : MonoBehaviour
{
    public bool Flying = false;
    public float MaxHeight = 10f;
    public float MaxMovementlimitLeft = -7f;
    public float MaxmovementlimitRight = 6.5f;
    public float Movemenspeed= 7f;
    public GameObject Wings;
    //public GameObject carModel;
    //WheelHit wheelHit;
    //private float speed = 50f;
    //public float dsitance = 4f;
    //private Vector3 forwardDirection;
    //private float rotationAmount;
    //RCC_CarControllerV3 car;
    //private float _X;
    //private float _y;
    //private float _z;
    //bool check;
    //private RaycastHit hit;
    //private bool isAircontrolTutorialOn = false;
    // public Transform raycastPoint;
    //Rigidbody Rb;
    //private HUDListner hud;
    //private HR_PlayerHandler hr_handler;
    Quaternion targetrotation;
    private void Start()
    {
        //car = gameObject.GetComponent<RCC_CarControllerV3>();
        //Rb = gameObject.GetComponent<Rigidbody>();
        // hud = FindObjectOfType<HUDListner>();
        //hr_handler = GetComponent<HR_PlayerHandler>();

    }
    void FixedUpdate()
    {
        if (Flying)
        {

            //Toolbox.GameplayController.SelectedVehiclePrefab.GetComponent<Rigidbody>().constraints = RigidbodyConstraints.FreezePositionY;
            //Toolbox.GameplayController.SelectedVehicleRccv3.enabled = false;
            transform.position = Vector3.MoveTowards(transform.position, new Vector3(transform.position.x,MaxHeight, transform.position.z), 5 * Time.deltaTime);
             targetrotation = Quaternion.Euler(0f,0f,0f);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetrotation, Time.deltaTime * 30);
           

            if (HUDListner.steering < 0)
            {
                if (transform.position.x >MaxMovementlimitLeft)
                    transform.position += Vector3.left * Movemenspeed * Time.deltaTime;
                //print("Left");
            }
            else if (HUDListner.steering > 0)
            {
                if (transform.position.x < MaxmovementlimitRight)
                    transform.position += Vector3.right * Movemenspeed * Time.deltaTime;
                //print("Right");
            }

        }


    }
   
    

    void OnTriggerEnter(Collider col)
    {
        if (col.gameObject.tag == "Flying")
        {
          //  print("Fly :"+col.gameObject.name);
            Toolbox.GameplayController.SelectedVehiclePrefab.GetComponent<Rigidbody>().constraints = RigidbodyConstraints.FreezePositionY;
            Toolbox.GameplayController.SelectedVehicleRccv3.enabled = false;
            if (col.gameObject.GetComponentInParent<Flydropobject>())
                col.gameObject.GetComponentInParent<Flydropobject>().helli.Pickfly();
            col.gameObject.SetActive(false);
            Flying = true;
            set_Statuswings(true);
            Invoke(nameof(DeactivateFlying), Random.Range(10, 14));
        }
    }

    private void DeactivateFlying()
    {
        Flying = false;
        Toolbox.GameplayController.SelectedVehiclePrefab.GetComponent<Rigidbody>().constraints = RigidbodyConstraints.None;
        Toolbox.GameplayController.SelectedVehicleRccv3.enabled = true;
        set_Statuswings(false);
    }
    private void set_Statuswings(bool _Val)
    {
        Wings.SetActive(_Val);
    }
}
