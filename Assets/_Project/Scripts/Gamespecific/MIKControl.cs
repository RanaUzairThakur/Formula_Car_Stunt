using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MIKControl : MonoBehaviour
{
    Animator anim;
    public Transform ikTarget;
    // Start is called before the first frame update
    bool isReady = false;
    void Start()
    {
        anim = GetComponent<Animator>();
        isReady = true;
    }

    void OnAnimatorIK()
    {
        if (isReady == false)
            return;
        anim.SetIKPositionWeight(AvatarIKGoal.LeftHand, 1);
        anim.SetIKRotationWeight(AvatarIKGoal.LeftHand, 1);
        anim.SetIKPosition(AvatarIKGoal.LeftHand, ikTarget.position);
        anim.SetIKRotation(AvatarIKGoal.LeftHand,ikTarget.rotation);
    }
}
