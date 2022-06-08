using UnityEngine;

public enum RotationAxis { None, X, Y, Z }
public class AirStabiity : MonoBehaviour
{
    GameObject Player;
    public bool stablerotation;
    private float smoothrotation = 3f;
    public float Targetangle = 0f;
    public RotationAxis Axis ;

    //public bool Airdragactivate;
    // Start is called before the first frame update
    //RCC_CarControllerV3 rccv3;
    //void Start()
    //{
    //    rccv3 = GetComponent<RCC_CarControllerV3>();
    //}
    private void Update()
    {
        // smooth rotation for stability
        if (Axis == RotationAxis.X)
        {
            Quaternion target = Quaternion.Euler(Targetangle, transform.rotation.y, transform.rotation.z);
            transform.rotation = Quaternion.Slerp(transform.rotation, target, Time.deltaTime * smoothrotation);
        }
        else if (Axis == RotationAxis.Y)
        {
            Quaternion target = Quaternion.Euler(Targetangle, transform.rotation.y, transform.rotation.z);
            transform.rotation = Quaternion.Slerp(transform.rotation, target, Time.deltaTime * smoothrotation);
        }
        else if (Axis == RotationAxis.Z)
        {
            Quaternion target = Quaternion.Euler(transform.rotation.y, transform.rotation.y,Targetangle);
            transform.rotation = Quaternion.Slerp(transform.rotation, target, Time.deltaTime * smoothrotation);
        }
        //if (stablerotation)
        //{
        //    Quaternion target = Quaternion.Euler(transform.rotation.x, Targetangle, transform.rotation.z);
        //    transform.rotation = Quaternion.Slerp(transform.rotation, target, Time.deltaTime * smoothrotation);
        //}


    }
    //void OnTriggerEnter(Collider col)
    //{
    //    if (col.gameObject.CompareTag("AirstableOn"))
    //    {
    //        stablerotation = true;
    //    }
    //    else if (col.gameObject.CompareTag("Airstableoff"))
    //    {
    //        stablerotation = false;
    //    }
    //    else if (col.gameObject.tag == "GameOver")
    //    {
    //        stablerotation = false;

    //    }
    //}
    public void Set_StatusrotationAngle(float angle, RotationAxis axis)
    {
        Targetangle = angle;
        Axis = axis;
    }
}
