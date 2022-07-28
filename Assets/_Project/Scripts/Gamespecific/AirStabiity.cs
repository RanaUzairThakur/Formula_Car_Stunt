using UnityEngine;

public enum RotationAxis { None, X, Y, Z ,XY,XZ,YZ }
public class AirStabiity : MonoBehaviour
{
    //GameObject Player;
    //public bool stablerotation;
    public float smoothrotation = 3f;
    public float Targetangle = 0f;
    public RotationAxis Axis ;

    //public bool Airdragactivate;
    // Start is called before the first frame update
    Rigidbody rccvrb;
    void Start()
    {
        rccvrb = GetComponent<Rigidbody>();
    }
    private void Update()
    {

        if (Axis == RotationAxis.None)
            return;
        // smooth rotation for stability
        if (Axis == RotationAxis.X)
        {
            Quaternion target = Quaternion.Euler(Targetangle, transform.rotation.y, transform.rotation.z);
            transform.rotation = Quaternion.Slerp(transform.rotation, target, Time.deltaTime * smoothrotation);
            rccvrb.angularVelocity = Vector3.zero;
            //if (transform.rotation == target)
            //    Axis = RotationAxis.None;
        }
        else if (Axis == RotationAxis.Y)
        {
            Quaternion target = Quaternion.Euler(transform.rotation.x, Targetangle, transform.rotation.z);
            transform.rotation = Quaternion.Slerp(transform.rotation, target, Time.deltaTime * smoothrotation);
            rccvrb.angularVelocity = Vector3.zero;
        }
        else if (Axis == RotationAxis.Z)
        {
            Quaternion target = Quaternion.Euler(transform.rotation.y, transform.rotation.y,Targetangle);
            transform.rotation = Quaternion.Slerp(transform.rotation, target, Time.deltaTime * smoothrotation);
            rccvrb.angularVelocity = Vector3.zero;
        }
        else if (Axis == RotationAxis.XY)
        {
            Quaternion targetX = Quaternion.Euler(0, transform.rotation.y, transform.rotation.z);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetX, Time.deltaTime * smoothrotation);
            Quaternion targeY = Quaternion.Euler(transform.rotation.x, Targetangle, transform.rotation.z);
            transform.rotation = Quaternion.Slerp(transform.rotation, targeY, Time.deltaTime * smoothrotation);
            rccvrb.angularVelocity = Vector3.zero;
        }
        else if (Axis == RotationAxis.XZ)
        {
            Quaternion targetX = Quaternion.Euler(0, transform.rotation.y, transform.rotation.z);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetX, Time.deltaTime * smoothrotation);
            Quaternion targetZ = Quaternion.Euler(transform.rotation.y, transform.rotation.y, Targetangle);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetZ, Time.deltaTime * smoothrotation);
            rccvrb.angularVelocity = Vector3.zero;
        }
        else if (Axis == RotationAxis.YZ)
        {
            Quaternion targetY = Quaternion.Euler(transform.rotation.x, 0, transform.rotation.z);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetY, Time.deltaTime * smoothrotation);
            Quaternion targetZ = Quaternion.Euler(transform.rotation.y, transform.rotation.y, Targetangle);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetZ, Time.deltaTime * smoothrotation);
            rccvrb.angularVelocity = Vector3.zero;
        }
       
    }
   
    public void Set_StatusrotationAngle(float angle, RotationAxis axis)
    {
        Targetangle = angle;
        Axis = axis;
    }
}
