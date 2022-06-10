using UnityEngine;

public enum StuntRotationAxis { None, X, Y, Z }
public class CarstuntHandler : MonoBehaviour
{
    //public float TakeOff = 5f;
    //float RotationAngle;
    //RCC_CarControllerV3 Player;
    //bool CarRotation, onetime;
    Rigidbody Rb;
    public Quaternion lastsavedrotation;
    public float Targetangle;
    public float smoothrotation = 200f;
    public StuntRotationAxis stuntrotationangle;
    private RCC_Camera rcccamera;
    //private bool stuntstarter;


    void Start()
    {
        //Player = gameObject.GetComponent<RCC_CarControllerV3>();
        Rb = gameObject.GetComponent<Rigidbody>();
        rcccamera = FindObjectOfType<RCC_Camera>();
    }
    private void FixedUpdate()
    {
        if (stuntrotationangle == StuntRotationAxis.None)
            return;
        // smooth rotation for stability
        if (stuntrotationangle == StuntRotationAxis.X)
        {
            Targetangle += Time.unscaledDeltaTime * smoothrotation;
            transform.rotation = Quaternion.Euler(Targetangle, transform.rotation.y, transform.rotation.z);
            Rb.angularVelocity = Vector3.zero;
            if (Targetangle >= 359)
            {
                stuntrotationangle = StuntRotationAxis.None;
                transform.rotation = Quaternion.Euler(lastsavedrotation.x, transform.rotation.y, transform.rotation.z);
                Targetangle = 0;
                lastsavedrotation = Quaternion.identity;
                rcccamera.stuntcameraangle = StuntCameraAngle.None;
            }
        }
        else if (stuntrotationangle == StuntRotationAxis.Y)
        {
            
                Targetangle += Time.unscaledDeltaTime * smoothrotation;
                transform.rotation = Quaternion.Euler(transform.rotation.x, Targetangle, transform.rotation.z);
                Rb.angularVelocity = Vector3.zero;
            if (Targetangle >= 359f)
            {
                stuntrotationangle = StuntRotationAxis.None;
                transform.rotation = Quaternion.Euler(transform.rotation.x, lastsavedrotation.y, transform.rotation.z);
                Targetangle = 0;
                lastsavedrotation = Quaternion.identity;
                rcccamera.stuntcameraangle = StuntCameraAngle.None;
            }
        }
        else if (stuntrotationangle == StuntRotationAxis.Z)
        {
            Targetangle += Time.unscaledDeltaTime * smoothrotation;
            transform.rotation = Quaternion.Euler(transform.rotation.x, transform.rotation.y, Targetangle);
            if (Targetangle >= 359)
            {
                stuntrotationangle = StuntRotationAxis.None;
                transform.rotation = Quaternion.Euler(transform.rotation.x, transform.rotation.y, lastsavedrotation.z);
                Targetangle = 0;
                lastsavedrotation = Quaternion.identity;
                rcccamera.stuntcameraangle = StuntCameraAngle.None;
            }
        }
    }


    public void Set_Statustantrotation(Quaternion lastrotation, StuntRotationAxis axis, float speed)
    {
        lastsavedrotation = lastrotation;
        stuntrotationangle = axis;
        rcccamera.stuntcameraangle = StuntCameraAngle.X;
        smoothrotation = speed;
    }


    //private void FixedUpdate()
    //{
    //    if (CarRotation)
    //    {
    //        autorotation();
    //    }

    //}


    //private void autorotation()
    //{

    //    RotationAngle += Time.unscaledDeltaTime * 200f;
    //    transform.rotation = Quaternion.Euler(transform.eulerAngles.x, transform.eulerAngles.y, RotationAngle);
    //    Rb.angularVelocity = Vector3.zero;
    //    if (RotationAngle > 359)
    //    {
    //        CarRotation = false;
    //        RotationAngle = 0f;
    //        Rb.transform.rotation = Quaternion.Euler(0f, transform.eulerAngles.y, 0f);
    //    }
    //}
    //void OnTriggerEnter(Collider col)
    //{
    //    if (col.gameObject.tag == "Jump")
    //    {
    //        CarRotation = true;

    //    }

    //}

}
